class UsersRepository
  # Get All user List
  def self.getUserList(searchUser, sort, direction)
    if searchUser
      users = User.joins(:role)
              .where("roles.name LIKE ? || users.name LIKE ? || users.email LIKE ? || users.created_at LIKE ?", 
              "%#{searchUser}%", "%#{searchUser}%", "%#{searchUser}%", "%#{searchUser}%")
              .order('id desc').page
    elsif sort
      users = User.order(sort + ' ' + direction).page # sort column
    else
      users = User.order('id desc').page # all user order by id desc
    end
  end

  # createUser
  # return isSaveUser
  def self.createUser(user)
    isSaveUser = user
  end

  # updateUser
  # return isUpdateUser
  def self.updateUser(user, user_params)
    isUpdateUser = user
  end

  # destroyUser
  # return isDeleteUser
  def self.destroyUser(user)
    isDeleteUser = user.delete
  end

  # Find user by id
  def self.getUserId(id)
    user = User.find(id)
  end
end