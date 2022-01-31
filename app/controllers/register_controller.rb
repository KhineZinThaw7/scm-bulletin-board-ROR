class RegisterController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  # register form
  def new
    @categories = Category.all
    redirect_to '/' if logged_in?
  end

  # create user
  def create
    @user = User.create(params.permit(:name, :email, :password, :role_id))
    if @user.save
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user).deliver
      redirect_to '/dashboard'
    else
      flash[:notice] = "Something Wrong, please check your registration information!"
      redirect_to '/register'
    end
  end
end
