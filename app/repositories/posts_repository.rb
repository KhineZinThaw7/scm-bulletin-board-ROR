class PostsRepository
  # Get All Post List
  def self.getPostList(searchPost, sort, direction)
    if searchPost
      @posts = Post.where(["title LIKE ?","%#{searchPost}%"]).order('id desc').page
    elsif sort
      @posts = Post.order(sort + ' ' + direction).page
    else
      @posts = Post.order('id desc').page
    end
  end

  # Get Post Detail
  def self.getPostDetail(id)
    @post = Post.find(id)
  end

  # Create new Post
  def self.createPost(post)
    isSavePost = post
  end

  # edit post
  def self.getPostEdit(id)
    @post = Post.find(id)
  end

  # update post
  def self.updatePost(post, post_params)
    isUpdatePost = post
  end

  # delete post
  def self.destroyPost(post)
    isDeletePost = post.delete
  end

  # get post id
  def self.getPostId(id)
    @post = Post.find(id)
  end
end