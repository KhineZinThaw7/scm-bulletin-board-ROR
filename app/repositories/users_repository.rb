class UsersRepository
  # Get All user List
  def self.getUserList(searchUser, sort, direction)
    if searchUser
      @users = User.where(["name LIKE ?","%#{searchUser}%"]).order('id desc').page
    elsif sort
      @users = User.order(sort + ' ' + direction).page
    else
      @users = User.page
    end
  end

  # Get user Detail
  def self.getUserDetail(id)
    @user = User.find(id)
  end

  # Create new user
  def self.createUser(user)
    isSaveUser = user
  end

  # edit user
  def self.getUserEdit(id)
    @user = User.find(id)
  end

  # update user
  def self.updateUser(user, user_params)
    isUpdateUser = user
  end

  # delete user
  def self.destroyUser(user)
    isDeleteUser = user.delete
  end

  # get user id
  def self.getUserId(id)
    @user = User.find(id)
  end
end