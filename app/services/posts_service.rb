class PostsService
    # post list
    def self.postList(searchPost, sort, direcion)
      @posts = PostsRepository.getPostList(searchPost, sort, direcion)
    end

    # post detail
    def self.postDetail(id)
      @post = PostsRepository.getPostDetail(id)
    end

    # Create new Post
    # params post_params
    # return isSavePost
    def self.createPost(post_params, userId)
      post = Post.new(post_params)
      post.status = 1 # default when create
      post.user_id = userId # It will change when post is create
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
      post.user_id =  current_user.id # It will change when post is update
      isUpdatePost = PostsRepository.updatePost(post, post_params)
    end

    #post delete
    def self.destroyPost(id)
      post = PostsRepository.getPostId(id)
      isDeletePost = PostsRepository.destroyPost(post)
    end
end