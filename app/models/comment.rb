class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_comments_counter
    post.update(comments_counter: comments.count)
    five_most_recent_comments_from_a_user = comments.find_by(author_id: id)
    five_most_recent_comments_from_a_user.order(created_at: :desc).limit(3)
  end
end
