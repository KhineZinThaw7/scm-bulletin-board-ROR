class PostsService
    # post list
    # params searchPost, sort, direction
    # return posts
    def self.postList(searchPost, sort, direction)
      posts = PostsRepository.getPostList(searchPost, sort, direction)
    end

    # post detail
    def self.postDetail(id)
      post = PostsRepository.getPostId(id)
    end

    # Create new Post
    # params post_params, userId
    # return isSavePost
    def self.createPost(post_params, userId)
      post = Post.new(post_params)
      post.user_id = userId # auth user id
      isSavePost = PostsRepository.createPost(post)
    end

    # post edit
    def self.editPost(id)
      post = PostsRepository.getPostId(id)
    end

    # post update
    # params id, post_params, userId
    # return isUpdatePost
    def self.updatePost(id, post_params, userId)
      post = PostsRepository.getPostId(id)
      post.user_id =  userId # auth user id
      isUpdatePost = PostsRepository.updatePost(post, post_params)
    end

    #post delete
    def self.destroyPost(id)
      post = PostsRepository.getPostId(id)
      isDeletePost = PostsRepository.destroyPost(post)
    end
end