require 'rails_helper'

describe UsersController, type: :request do
  describe '#index' do

 before do
      @user = User.create(name: 'Brian', photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo', bio: 'Software developer',posts_counter: 0)
      @post = Post.create(title: 'post 1', text: 'First post', comments_counter: 0, likes_counter: 0, author: @user)
     

    end

    it 'returns a successful response' do
      get users_path
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get users_path
      expect(response.body).to include('Brian')
    end
  end

  describe '#show' do

 before do
      @user = User.create(name: 'Brian', photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo', bio: 'Software developer',posts_counter: 0)
      @post = Post.create(title: 'post 1', text: 'First post', comments_counter: 0, likes_counter: 0, author: @user)
     

    end

    it 'returns a successful response' do
       get users_path(@user)
      expect(response).to be_successful
    end

    it 'includes correct placeholder text in the response body' do
       get users_path(@user)
      expect(response.body).to include('Brian')
    end
  end
end
