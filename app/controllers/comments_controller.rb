class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy

    respond_to do |format|
      format.html do
        redirect_to user_post_path, notice: 'Comment was destroyed successfully.'
      end
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
