require 'rails_helper'

describe 'users index page', type: :system do

let!(:user1) { User.create(name: 'Tom', bio: 'Teacher from Mexico.', posts_counter: 0) }
let!(:user2) { User.create(name: 'Sammy', bio: 'Software Developer from Singapore', posts_counter: 2) }
let!(:user3) { User.create(name: 'Benjamin', bio: 'Builder from Nigeria', posts_counter: 3) }


  it 'shows all usernames for all users in the app' do
    visit users_path 
    expect(page).to have_content(user1.name)
     expect(page).to have_content(user2.name)
      expect(page).to have_content(user3.name)
  end

   it 'shows profile picture for all users' do
    visit users_path 
    expect(page).to have_content(user1.photo)
     expect(page).to have_content(user2.photo)
      expect(page).to have_content(user3.photo)
  end
end