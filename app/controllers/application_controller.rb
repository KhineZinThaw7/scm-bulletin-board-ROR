require 'csv'
class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :authUser
    helper_method :logged_in?
    helper_method :isAdmin?
    helper_method :isUser?
    helper_method :adminRole
    helper_method :postUser

    @@admin = 1
    @@user = 2

    # To get auth user
    def authUser    
        User.find_by(id: session[:user_id])  
    end

    # Check if logged in
    def logged_in?
        !authUser.nil?  
    end

    # Redirect to login without authorized
    def authorized
        redirect_to '/login' unless logged_in?
    end

    # Check if auth user role is admin?
    def isAdmin?
        authUser.role_id === @@admin
    end

    # Check if auth user role is user?
    def isUser?
        authUser.role_id === @@user
    end

    # Redirect to some path unless admin?
    def adminRole
        redirect_to 'something_path' unless isAdmin?
    end

    # Make permission for posts
    def postUser(postId)
        post = Post.find(postId)
        post.user.id === authUser.id
    end
end
