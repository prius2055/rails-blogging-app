class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  before_save do
    update_user_posts_counter
  end

  def update_user_posts_counter
    user = User.find_by(id: author.id)
    user.increment!(:posts_counter)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
