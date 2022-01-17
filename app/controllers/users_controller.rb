class UsersController < ApplicationController
  before_action :authorized

  # index user list
  def index
    @users = UsersService.userList(params[:searchUser], params[:sort], params[:direction])
  end

  # user Detail
  def show
    @user = UsersService.userDetail(params[:id])
  end

  # New user form
  def new
    @user = User.new
  end

  # Create a new user
  def create
    @user = UsersService.createUser(user_params)
    if @user.save
      redirect_to '/users'
    else
      render :new
    end
  end

  # edit user
  def edit
    @user = UsersService.editUser(params[:id])
  end

  # update user
  def update
    @user = UsersService.updateUser(params[:id], user_params)
    if @user.update(user_params)
      redirect_to '/users'
    else
      render :edit
    end
  end

  # delete user
  def destroy
    isDeleteUser = UsersService.destroyUser(params[:id])
    if isDeleteUser
      redirect_to '/users'
    else
      render :delete
    end
  end

  # export
  def export
    @users = User::all
    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=users.csv"
        render template: "users/index.csv.erb"
      end
    end
  end

  private

  # user parameters
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
