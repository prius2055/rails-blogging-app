class Comment < ApplicationRecord
    belongs_to :post

    def update_post_comments_counter
        post.update(comments_counter: comments.count)
    end
end
