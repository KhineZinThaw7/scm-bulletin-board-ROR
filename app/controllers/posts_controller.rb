class PostsController < ApplicationController
  http_basic_authenticate_with name: "kzt", password: "secret", except: [:index, :show]
  # index post list
  def index
    @posts = PostsService.postList(params[:searchPost])
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
    @post = PostsService.createPost(post_params)
    if @post.save
      redirect_to root_path
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
    @post = PostsService.updatePost(params[:id], post_params)
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # delete post
  def destroy
    isDeletePost = PostsService.destroyPost(params[:id])
    if isDeletePost
      redirect_to root_path
    else
      render :delete
    end
  end

  private

  # post parameters
  def post_params
    params.require(:post).permit(:title, :description, :status, :create_post_id, :updated_post_id, :updated_at)
  end
end
