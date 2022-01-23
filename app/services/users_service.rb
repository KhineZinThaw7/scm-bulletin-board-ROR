class UsersService
    # user list
    def self.userList(searchName, searchEmail, sort, direction)
      @users = UsersRepository.getUserList(searchName, searchEmail, sort, direction)
    end

    # user detail
    def self.userDetail(id)
      @user = UsersRepository.getUserDetail(id)
    end

    # Create new user
    # params user_params
    # return isSaveuser
    def self.createUser(user_params)
      user = User.new(user_params)
      isSaveUser = UsersRepository.createUser(user)
    end

    # user edit
    def self.editUser(id)
      @user = UsersRepository.getUserEdit(id)
    end

    # user edit
    def self.updateUser(id, user_params)
      user = UsersRepository.getUserId(id)
      isUpdateUser = UsersRepository.updateUser(user, user_params)
    end

    #user delete
    def self.destroyUser(id)
      user = UsersRepository.getUserId(id)
      isDeleteUser = UsersRepository.destroyUser(user)
    end
end