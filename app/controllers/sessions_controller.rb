class SessionsController < ApplicationController

  skip_before_action :require_sign_in!, only: [:new, :create]
  before_action :validate_user, only: [:create]
  
  def new
  end

  def create
    if @user.authenticate(session_params[:password])
      sign_in(@user)
      redirect_to users_path
    else
      flash[:danger] = 'メールアドレスまたはパスワードが正しくありません'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def validate_user
    @user = User.find_by!(email: session_params[:email])
    if @user.is_valid == false
      reset_session
      redirect_to signup_path
    end
  rescue
    flash.now[:danger] = t('.flash.invalid_email')
    render action: 'new'
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
  
end
