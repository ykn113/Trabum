class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post = Post.new
    @continent_list = Continent.pluck('name, id')
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id), notice: "写真を保存しました。"
    else
      @continent_list = Continent.pluck('name, id')
      render :new
    end
  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:image, :country, :city, :continent_id, :from_date, :to_date, :flight, :memo )
  end
end
