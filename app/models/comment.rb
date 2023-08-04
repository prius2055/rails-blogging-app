class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  before_save do
    update_post_comments_counter
  end

  def update_post_comments_counter
    post = Post.find_by(id: post_id)
    post.increment!(:comments_counter)
  end
end
