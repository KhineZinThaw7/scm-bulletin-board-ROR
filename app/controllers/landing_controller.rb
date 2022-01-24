class LandingController < ApplicationController
  skip_before_action :authorized, only: [:index, :blog]

	# home page
	def index
		@posts = Post.all
		@categories = Category.all
		render template: "landing/home"
	end

	# all posts page
	def blog
		@posts = Post.all
		@categories = Category.all
		render template: "landing/blog"
	end

	# category posts
	def categoryPosts
		@categories = Category.all
		@category = Category.find(params[:id])
		render template: "landing/category-posts"
	end

	# post detail
	def postDetail
		@post = Post.find(params[:id])
		@categories = Category.all
		render template: "landing/post-detail"
	end
end
