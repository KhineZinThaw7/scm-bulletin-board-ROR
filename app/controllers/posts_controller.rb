class PostsController < ApplicationController
  layout 'admin/admin'
  before_action :authorized

  # index post list
  def index
    @posts = PostsService.postList(params[:searchPost], params[:sort], params[:direction])
  end

  # Post Detail
  def show
    @post = PostsService.postDetail(params[:id])
  end

  # New Post form
  def new
    @post = Post.new
  end

  # Create a new Post
  def create
    @post = PostsService.createPost(post_params, authUser.id)
    if @post.save
      redirect_to '/posts'
    else
      render :new
    end
  end

  # edit post
  def edit
    @post = PostsService.editPost(params[:id])
  end

  # update post
  def update
    @post = PostsService.updatePost(params[:id], post_params, authUser.id)
    if @post.update(post_params)
      redirect_to '/posts'
    else
      render :edit
    end
  end

  # delete post
  def destroy
    isDeletePost = PostsService.destroyPost(params[:id])
    if isDeletePost
      redirect_to '/posts'
    else
      render :delete
    end
  end

  # export
  def export
    @posts = Post::all
    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=posts.csv"
        render template: "posts/index.csv.erb"
      end
    end
  end

  private

  # post parameters
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
