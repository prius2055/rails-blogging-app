class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes

    def update_user_posts_counter
        user.update(posts_counter:(posts.count))
    end

    def five_most_recent_comments
        comments.order(created_at :desc).limit(5)
    end
end
