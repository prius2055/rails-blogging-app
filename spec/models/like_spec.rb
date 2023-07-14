require 'rails_helper'

describe Like, type: :model do
  describe ' #update_post_likes_counter' do
    let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }
    let(:post) do
      Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    end
    let(:like) { Like.create(author: user, post:) }

    it 'increments the likes_counter of the associated post' do
      puts post.inspect
      puts user.inspect
      expect { like.update_post_likes_counter }.to change { post.reload.likes_counter }.by(1)
    end
  end
end
