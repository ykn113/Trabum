class UsersController < ApplicationController

  skip_before_action :require_sign_in!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render "new"
    end
  end
  
  def index
    @continents = Continent.all
    
    @posts = current_user.posts
    @all_posts_count = @posts.count
    # if @all_posts_count <= 5
    #   render html: helpers.tag.strong('旅行ビギナー')
    # end
  end
  
  def show
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
