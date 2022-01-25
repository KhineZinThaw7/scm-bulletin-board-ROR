class UsersService
    # user list
    # params searchUser, sort and direction
    # return users
    def self.userList(searchUser, sort, direction)
      users = UsersRepository.getUserList(searchUser, sort, direction)
    end

    # user detail
    def self.userDetail(id)
      user = UsersRepository.getUserId(id)
    end

    # create new user
    # params user_params
    # return isSaveUser
    def self.createUser(user_params)
      user = User.new(user_params)
      isSaveUser = UsersRepository.createUser(user)
    end

    # user edit
    def self.editUser(id)
      user = UsersRepository.getUserId(id)
    end

    # user edit
    # params id, user_params
    # return isUpdateUser
    def self.updateUser(id, user_params)
      user = UsersRepository.getUserId(id)
      isUpdateUser = UsersRepository.updateUser(user, user_params)
    end

    # user delete
    def self.destroyUser(id)
      user = UsersRepository.getUserId(id)
      isDeleteUser = UsersRepository.destroyUser(user)
    end

     # user profile
     def self.profile(id)
      user = UsersRepository.getUserId(id)
    end
end