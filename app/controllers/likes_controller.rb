class LikesController < ApplicationController
  def index
    @like = Like.new
    @post = Post.find(params[:id])
  end

  def new
    @like = Like.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(post: @post, author: current_user)


    if @like.save
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
    else
      redirect_to :new
    end
  end
end
