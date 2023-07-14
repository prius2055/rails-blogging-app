require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'Tim', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer from London') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.posts_counter = 1
    expect(subject).to be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 0.002
    expect(subject).to_not be_valid
  end

    describe '#three_most_recent_post' do
    let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }
    let!(:post1) { Post.create(author: first_user, title: 'Post 1', text: 'This is post 1',created_at: 1.day.ago,comments_counter: 0, likes_counter: 0) }
    let!(:post2) { Post.create(author: first_user,title: 'Post 2', text: 'This is post 2', created_at: 2.days.ago,comments_counter: 0, likes_counter: 0) }
    let!(:post3) { Post.create(author: first_user,title: 'Post 3', text: 'This is post 3', created_at: 3.days.ago, comments_counter: 0, likes_counter: 0) }
    let!(:post4) { Post.create(author: first_user,title: 'Post 4', text: 'This is post 4', created_at: 4.days.ago,comments_counter: 0, likes_counter: 0) }

    it 'returns the three most recent posts' do
      expect(first_user.three_most_recent_post).to eq([post1, post2, post3])
    end
  end
end
