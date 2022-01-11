class PostsService
    # post list
    def self.postList(searchPost)
      @posts = PostsRepository.getPostList(searchPost)
    end

    # post detail
    def self.postDetail(id)
      @post = PostsRepository.getPostDetail(id)
    end

    # Create new Post
    # params post_params
    # return isSavePost
    def self.createPost(post_params)
      post = Post.new(post_params)
      post.status = 1 # default when create
      post.create_user_id = 1 #It will change when user is created
      post.updated_user_id = 1 #It will change when user is created
      post.updated_at = Time.now
      isSavePost = PostsRepository.createPost(post)
    end

    # post edit
    def self.editPost(id)
      @post = PostsRepository.getPostEdit(id)
    end

    # post edit
    def self.updatePost(id, post_params)
      post = PostsRepository.getPostId(id)
      post.status = 1 # default when create
      post.create_user_id = 1 #It will change when user is created
      post.updated_user_id = 1 #It will change when user is created
      post.updated_at = Time.now
      isUpdatePost = PostsRepository.updatePost(post, post_params)
    end

    #post delete
    def self.destroyPost(id)
      post = PostsRepository.getPostId(id)
      isDeletePost = PostsRepository.destroyPost(post)
    end
end