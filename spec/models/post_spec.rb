require 'rails_helper'

describe Post, type: :model do
  let(:first_user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
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

  it 'comments_counter should be greater than or equal to 1' do
    subject.comments_counter = 0
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = 0.05
    expect(subject).to_not be_valid
  end


  it 'likes_counter should be greater than or equal to 1' do
    subject.likes_counter = 0
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    subject.likes_counter = 0.007
    expect(subject).to_not be_valid
  end
end
