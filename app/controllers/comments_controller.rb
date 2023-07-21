class CommentsController < ApplicationController
 

   def new
    @post = Post.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = post.id

   if @comment.save
      redirect_to post_path, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

    private

  def comment_params
    params.require(:comment).permit(:text)
  end

end