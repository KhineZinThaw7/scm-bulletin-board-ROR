require 'csv'
class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :authUser
    helper_method :logged_in?

    def authUser    
        User.find_by(id: session[:user_id])  
    end

    def logged_in?
        !authUser.nil?  
    end

    def authorized
        redirect_to '/login' unless logged_in?
     end
end
