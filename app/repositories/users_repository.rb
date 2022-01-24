class UsersRepository
  # Get All user List
  def self.getUserList(searchName, searchEmail, sort, direction)
    if searchName || searchEmail
      users = User.where("name LIKE ? && email LIKE ?", 
              "%#{searchName}%", "%#{searchEmail}%").order('id desc').page
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