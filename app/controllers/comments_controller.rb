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
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
    else
      render :new
    end
  end

    private

  def comment_params
    params.require(:comment).permit(:text)
  end

end