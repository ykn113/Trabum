class UsersController < ApplicationController
  skip_before_action :require_sign_in!, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to users_path
    else
      render "new"
    end
  end

  def index
    @continents = Continent.all
  end

  def show
    user_posts = current_user.posts
    all_posts_count = user_posts.count
    @user_level = User.level_check(all_posts_count)
    @completed_badges = User.badge_check(user_posts)
  end
  
  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_valid: false)
    sign_out
    flash[:notice] = "退会しました。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
