class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/dashboard'
    else
       redirect_to '/login'
    end
  end

  def welcome
  end

  def dashboard
  end

  def destroy 
    session[:user_id] = nil
    redirect_to root_path
  end
end
