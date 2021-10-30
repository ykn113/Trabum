class UsersController < ApplicationController
  # BEGINNER = "旅行ビギナー"
  # MASTER = "旅行マスター"

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
    @count_list = []
    @continents = Continent.all
    for i in 2..9 do
      @continent = @continents.find(i)
      @area_count = @continent.posts.count
      @count_list.push(@area_count)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
