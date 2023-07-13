class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
