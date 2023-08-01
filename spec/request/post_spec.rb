require 'rails_helper'

describe PostsController, type: :request do
  describe '#index' do
       before do
      @user = User.create(name: 'Brian', photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo', bio: 'Software developer',posts_counter: 0)
      @post = Post.create(title: 'post 1', text: 'First post', comments_counter: 0, likes_counter: 0, author: @user)
     

    end
    it 'returns a successful response' do
       get user_posts_path(@user)
      expect(response).to be_successful
    end

    it 'renders the index template' do
       get user_posts_path(@user)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
       get user_posts_path(@user)
      expect(response.body).to include('First post')
    end
  end

  describe '#show' do
 before do
      @user = User.create(name: 'Brian', photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo', bio: 'Software developer',posts_counter: 0)
      @post = Post.create(title: 'post 1', text: 'First post', comments_counter: 0, likes_counter: 0, author: @user)
     

    end
    
    it 'returns a successful response' do
      get user_post_path(@user, @post)
      expect(response).to be_successful
    end

    it 'renders the show template' do
       get user_post_path(@user, @post)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
       get user_post_path(@user, @post)
      expect(response.body).to include('First post')
    end
  end
end
