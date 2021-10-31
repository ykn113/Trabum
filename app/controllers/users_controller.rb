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
    @all_posts_count = current_user.posts.count
    @user_level = User.level_check(@all_posts_count)
  end

  def show
    @user_posts = current_user.posts
    @completed_badges = User.badge_check(@user_posts)
    @completed_badges_js = @completed_badges.to_json.html_safe

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
