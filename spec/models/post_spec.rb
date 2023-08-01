require 'rails_helper'

describe Post, type: :model do
  let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }
  subject { Post.new(author: first_user, title: 'Hello', text: 'This is my first post') }
  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be less than 251 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = 0.05
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    subject.likes_counter = 0.007
    expect(subject).to_not be_valid
  end

  describe '#update_user_posts_counter' do
    let(:post) do
      Post.create(author: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                  likes_counter: 0)
    end
    it 'increments the posts_counter when a new post is added' do
      expect { post}.to change { first_user.reload.posts_counter }.by(1)
    end
  end

  describe '#five_most_recent_comments' do
    let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }
    let(:first_post) do
      Post.create(author: first_user, title: 'Post 1', text: 'This is post 1', comments_counter: 0, likes_counter: 0)
    end

    let!(:comment1) { Comment.create(author: first_user, post: first_post, created_at: 1.days.ago) }
    let!(:comment2) { Comment.create(author: first_user, post: first_post, created_at: 2.days.ago) }
    let!(:comment3) { Comment.create(author: first_user, post: first_post, created_at: 3.days.ago) }
    let!(:comment4) { Comment.create(author: first_user, post: first_post, created_at: 4.days.ago) }
    let!(:comment5) { Comment.create(author: first_user, post: first_post, created_at: 5.days.ago) }
    let!(:comment6) { Comment.create(author: first_user, post: first_post, created_at: 6.days.ago) }

    it 'returns the three most recent posts' do
      expect(first_post.five_most_recent_comments).to eq([comment1, comment2, comment3, comment4, comment5])
    end
  end
end
