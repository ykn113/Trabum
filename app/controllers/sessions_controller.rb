class SessionsController < ApplicationController

  skip_before_action :require_sign_in!, only: [:new, :create]
  before_action :set_user, only: [:create]

  def new
  end

  def create
    if @user.authenticate(session_params[:password])
      sign_in(@user)
      redirect_to users_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find_by!(email: session_params[:email])
  rescue
    flash.now[:danger] = t('.flash.invalid_mail')
    render action: 'new'
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
  
  def reject_inactive_user
    @user = current_user
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_valid
        reset_session
        redirect_to signup_path
      end
    end
  end

end
