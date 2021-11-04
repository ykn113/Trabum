class PostsController < ApplicationController
  def index
    @continents = Continent.all
    if params[:continent_id]
      @continent = @continents.find(params[:continent_id])
      @posts = @continent.posts.where(user_id: current_user.id).page(params[:page]).per(6)
    else
      @posts = current_user.posts.page(params[:page]).per(6).order(id: "DESC")
    end
    @all_posts_count = @posts.total_count
  end

  def show
    @post = Post.find(params[:id])
    redirect_to users_path unless current_user == @post.user
  end

  def new
    @post = Post.new
    @continent_list = Continent.pluck('name, id')
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id), notice: "コレクションに追加しました。"
    else
      @continent_list = Continent.pluck('name, id')
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @continent_list = Continent.pluck('name, id')
    if @post.user.id == current_user.id
      render :edit
    else
      redirect_to :posts_path
    end
  end
  
  def update
    @post = Post.find(params[:id])
    @continents = Continent.all
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: '投稿を編集しました。'
    else
      @continent_list = Continent.pluck('name, id')
      render :edit
    end
  end
  
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :country, :city, :continent_id, :from_date, :to_date, :flight, :memo)
  end
end
