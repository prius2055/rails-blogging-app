class User < ApplicationRecord
    has_many :posts

    def three_most_recent_post
        # toms = posts.find_by(author_id:user.id)
        # posts.order(created_at: :desc).limit(3)
        puts 'Hello post'
    end
    
end
