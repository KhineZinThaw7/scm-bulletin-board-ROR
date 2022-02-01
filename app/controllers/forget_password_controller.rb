class ForgetPasswordController < ApplicationController
  skip_before_action :authorized, only: [:forgetPassword, :forgetPasswordEmail, :new,  :resetPassword]

  # to make forget password
  def forgetPassword
    @categories = Category.all
    render template: "forget_password/send_email"
  end

  # mail send to user forget password
  def forgetPasswordEmail
    @user = User.find_by(email: params[:email]) 
    if @user
        @user.send_password_reset
        flash[:notice] = "Email sent successfully, please check your email!"
        redirect_to '/forget-password'
    else
        flash[:warning] = "Email is invalid"
        redirect_to '/forget-password'
    end
  end

  # reset password view
  def new
    @categories = Category.all
    @user = User.find_by_password_reset_token!(params[:id])
    render template: "forget_password/reset_password"
  end

  # make reset password
  def resetPassword
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.update(params.require(:user).permit(:password))
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    else
      redirect_to passwordReset_path(params[:id])
    end
  end
end
