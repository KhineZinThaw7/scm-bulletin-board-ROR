class RegisterController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User
  end

  def create
    @user = User.create(params.permit(:name, :email, :password))
    session[:user_id] = @user.id
    redirect_to '/dashboard'
  end
end
