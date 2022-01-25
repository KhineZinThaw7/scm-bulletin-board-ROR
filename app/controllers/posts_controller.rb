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
      flash[:notice] = "Post successfully created"
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
      flash[:notice] = "Post successfully updated"
      redirect_to '/posts'
    else
      render :edit
    end
  end

  # delete post
  def destroy
    isDeletePost = PostsService.destroyPost(params[:id])
    if isDeletePost
      flash[:notice] = "Post successfully deleted"
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

  # import
  def import
    if params[:importFile] # if param file is contained?
      @post = Post.import(params[:importFile])
      if @post
        flash[:danger] = "Post CSV import failed!" # if get validation error
        flash[:error] = @post
      else
        flash[:notice] = "Post successfully imported!" # if success
      end  
    else
      flash[:danger] = "Please choose upload csv file!" # if parama file is not contained, get alert message
    end
    redirect_to '/posts'
  end

  private

  # post parameters
  def post_params
    params.require(:post).permit(:title, :description, :image, :category_id, :status)
  end
end
