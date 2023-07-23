class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # after_save :update_likes_count

  # private

  after_save do
    post = Post.find_by(id: post_id)
    post.increment!(:likes_counter)
  end
end
