require 'csv'
class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :authUser
    helper_method :logged_in?
    helper_method :isAdmin?
    helper_method :isUser?
    helper_method :adminRole
    helper_method :postUser

    def authUser    
        User.find_by(id: session[:user_id])  
    end

    def logged_in?
        !authUser.nil?  
    end

    def authorized
        redirect_to '/login' unless logged_in?
    end

    def isAdmin?
        authUser.role_id === 1
    end

    def isUser?
        authUser.role_id === 2
    end

    def adminRole
        redirect_to 'something_path' unless isAdmin?
    end

    def postUser(postId)
        post = Post.find(postId)
        post.user.id === authUser.id
    end
end
