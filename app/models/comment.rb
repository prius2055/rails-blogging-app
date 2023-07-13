class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def three_most_recent_post
    three_most_recent_post_from_a_user = posts.find_by(author_id:id)
    three_most_recent_post_from_a_user.order(created_at: :desc).limit(3)
  end
end
