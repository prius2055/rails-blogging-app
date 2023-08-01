class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_likes_counter

  def update_post_likes_counter
    post = Post.find_by(id: post_id)
    post.increment!(:likes_counter)
  end
end
