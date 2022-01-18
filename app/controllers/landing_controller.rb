class LandingController < ApplicationController
    skip_before_action :authorized, only: [:index, :blog]

    def index
        @posts = Post.all
        render template: "landing/home"
    end

    def blog
        @posts = Post.all
        render template: "landing/blog"
    end
end
