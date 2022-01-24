class PostsRepository
  # Get All Post List
  def self.getPostList(searchPost, sort, direction)
    if searchPost
      posts =  Post.where("title LIKE ? OR description LIKE ? OR created_at LIKE ?", 
                "%#{searchPost}%", "%#{searchPost}%", "%#{searchPost}%").order('id DESC').page 
                # search by title, description and created at
    elsif sort
      posts = Post.order(sort + ' ' + direction).page # sort column 
    else
      posts = Post.order('id desc').page # all post order by id desc
    end
  end

  # Create new Post
  # return isSavePost
  def self.createPost(post)
    isSavePost = post
  end

  # Update post
  # return isUpdatePost
  def self.updatePost(post, post_params)
    isUpdatePost = post
  end

  # Delete post
  # return isDeletePost
  def self.destroyPost(post)
    isDeletePost = post.delete
  end

  # Find post by id
  def self.getPostId(id)
    post = Post.find(id)
  end
end