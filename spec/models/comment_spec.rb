
require 'rails_helper'

describe Like, type: :model do
  describe ' #update_post_comments_counter' do
    let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }
    let(:first_post) {Post.create(author: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)}
    
    let(:first_comment) { Comment.create(author: first_user, post:first_post) }

    it 'increments the comments_counter of the associated post' do
    
      expect { first_comment.update_post_comments_counter }.to change { first_post.reload.comments_counter }.by(1)
    end
  end
end
