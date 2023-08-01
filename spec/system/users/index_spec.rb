require 'rails_helper'

# describe 'users index page', type: :system do

# let!(:user1) { User.create(name: 'Tom', bio: 'Teacher from Mexico.', posts_counter: 0) }
# let!(:user2) { User.create(name: 'Sammy', bio: 'Software Developer from Singapore', posts_counter: 2) }
# let!(:user3) { User.create(name: 'Benjamin', bio: 'Builder from Nigeria', posts_counter: 3) }

#   it 'shows all usernames for all users in the app' do
#     visit users_path 
#     expect(page).to have_content(user1.name)
#      expect(page).to have_content(user2.name)
#       expect(page).to have_content(user3.name)
#   end

#    it 'shows profile picture for all users' do
#     visit users_path 
#     expect(page).to have_content(user1.photo)
#      expect(page).to have_content(user2.photo)
#       expect(page).to have_content(user3.photo)
#   end


#   #post count

#    it ' redirects to a show page, when I click on a user' do
#      visit users_path
#       save_and_open_page
#   #  click_on "#{user2.name}"

#    first(:link, user1.name).click
#     save_and_open_page
#     expect(page).to have_current_path(user_path(user1))

#   end



# end

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

    it 'should redirected to that user show page, When I click on a user' do
      click_link @user1.name
      expect(page).to have_current_path(user_path(@user1))
    end
  end
end