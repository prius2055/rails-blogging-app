class CommentsController < ApplicationController
 

   def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.likes_counter = 0
    @post.comments_counter = 0

   if @post.save
      redirect_to users_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

    private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end