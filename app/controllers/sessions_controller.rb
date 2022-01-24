class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  # login form
  def new
    @categories = Category.all
    redirect_to '/' if logged_in?
  end

  # if login success, auth session create
  def create
    @user = User.find_by(email: params[:email]) 
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/dashboard'
    else
      flash[:notice] = "Something Wrong, please check your registration email and password!"
      redirect_to '/login'
    end
  end

  # if logout, session destroy
  def destroy 
    session[:user_id] = nil
    redirect_to '/login'
  end
end
