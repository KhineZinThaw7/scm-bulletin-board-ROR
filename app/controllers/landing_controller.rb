class LandingController < ApplicationController
    skip_before_action :authorized, only: [:index, :blog]

    def index
        @posts = Post.all
        @categories = Category.all
        render template: "landing/home"
    end

    def blog
        @posts = Post.all
        @categories = Category.all
        render template: "landing/blog"
    end

    def categoryPosts
        @categories = Category.all
        @category = Category.find(params[:id])
        render template: "landing/category-posts"
    end
end
