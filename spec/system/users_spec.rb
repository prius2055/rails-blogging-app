require 'rails_helper'

describe 'User', type: :system do
  before(:each) do
    @user1 = User.create(name: 'Prince', photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo', bio: 'Software developer',posts_counter: 0)
    @user2 = User.create(name: 'Mahabub', photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo', bio: 'Coder', posts_counter: 0)
  end

  describe 'user#index' do
    before(:each) do
      visit users_path
    end
    it 'should show the username of all other users.' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end

    it 'should show the profile picture for each user.' do
      expect(page).to have_xpath("//img[contains(@src,'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo')]")
    end

    it 'should show the number of posts each user has written.' do
      expect(page).to have_content("Number of post: #{@user1.posts_counter}")
    end

    it 'should redirected to that user show page, When I click on a user' do
      click_link @user1.name
      expect(page).to have_current_path(user_path(@user1))
    end
  end

   describe 'user#show' do
    before(:each) do
    @post1 = Post.create(title: 'post 1', text: 'First post', comments_counter: 0, likes_counter: 0, author: @user1)
     @post2 = Post.create(title: 'post 2', text: 'Second post', comments_counter: 0, likes_counter: 0, author: @user1)
      @post3 = Post.create(title: 'post 3', text: 'Third post', comments_counter: 0, likes_counter: 0, author: @user1)
  

      visit user_path(@user1)
    end

    it 'should show the user profile picture' do
      expect(page).to have_xpath("//img[contains(@src,'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo')]")
    end

    it 'should show the user username' do
      expect(page).to have_content(@user1.name)
    end

    it 'should show the number of posts each user has written.' do
      expect(page).to have_content("Number of post: 3")
    end

    it 'should show the user bio' do
      expect(page).to have_content(@user1.bio)
    end

   
  end
end
