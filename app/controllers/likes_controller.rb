class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]

    if @like.save
      redirect_to "/users/#{params[:user_id]}/posts"
    else
      render :new
    end
  end
end