class UsersController < ApplicationController
  layout 'admin/admin'
  before_action :authorized
  before_action :adminRole

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
      flash[:notice] = "User successfully created"
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
      flash[:notice] = "User successfully updated"
      redirect_to '/users'
    else
      render :edit
    end
  end

  # delete user
  def destroy
    isDeleteUser = UsersService.destroyUser(params[:id])
    if isDeleteUser
      flash[:notice] = "User successfully deleted"
      redirect_to '/users'
    else
      render :delete
    end
  end

  # user profile
  def profile
    @user = UsersService.profile(authUser.id)
    render template: 'users/profile'
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

  # import
  def import
    if params[:importFile] # if param file is contained?
      @user = User.import(params[:importFile])
      if @user
        flash[:danger] = "User CSV import failed!" # if get validation error
        flash[:error] = @user
      else
        flash[:notice] = "User CSV successfully imported!" # if success
      end  
    else
      flash[:danger] = "Please choose upload csv file!" # if parama file is not contained, get alert message
    end
    redirect_to '/users'
  end

  private

  # user parameters
  def user_params
    params.require(:user).permit(:name, :email, :password, :role_id)
  end
end
