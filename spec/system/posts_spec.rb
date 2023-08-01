require 'rails_helper'

describe 'Post', type: :system do
  before(:each) do
    @user3 = User.create(name: 'Brian',
                         photo: 'https://unsplash.com/photos/G-jo31ESuRE',
                         bio: 'Software developer', posts_counter: 0)
    @post1 = Post.create(title: 'post 1', text: 'First post for user 3', comments_counter: 0, likes_counter: 0,
                         author: @user3)
    @comment1 = Comment.create(text: 'Hey this is Brian. I like this work', author: @user3, post: @post1)
    @like = Like.create(author_id: @user3.id, post_id: @post1.id)
  end

  describe 'post#index' do
    before(:each) do
      visit user_posts_path(@user3)
    end

    it 'should show the profile picture for each user.' do
      expect(page).to have_xpath("//img[contains(@src,'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo')]")
    end

    it 'should show the username of the user' do
      expect(page).to have_content(@user3.name)
    end

    it 'should show the number of posts the user has written.' do
      expect(page).to have_content('Number of post: 1')
    end

    it 'should show a post title' do
      expect(page).to have_content('post 1')
    end

    it 'should show some of the post body.' do
      expect(page).to have_content('First post')
    end

    it 'should show the first comment on a post.' do
      expect(page).to have_content('Hey this is Brian. I like this work')
    end

    it 'should show how many comments a post has' do
      expect(page).to have_content('Comments:1')
    end

    it 'should show how many likes a post has' do
      expect(page).to have_content('Likes:1')
    end

    it 'should show a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('Pagination')
    end

    it 'should redirected to that post show page, When I click on a post' do
      click_link 'View post'
      expect(page).to have_current_path(user_post_path(@user3, @post1))
    end
  end

  describe 'post#show' do
    before(:each) do
      @user3 = User.create(name: 'Brian',
                           photo: 'https://unsplash.com/photos/man-person-standing-between-tall-trees-F_-0BxGuVvo',
                           bio: 'Software developer', posts_counter: 0)
      @post1 = Post.create(title: 'post 1', text: 'First post for user 3', comments_counter: 0, likes_counter: 0,
                           author: @user3)
      @comment1 = Comment.create(text: 'Hey this is Brian. I like this work', author: @user3, post: @post1)
      @like = Like.create(author_id: @user3.id, post_id: @post1.id)
      visit user_posts_path(@user3, @post1)
    end

    it 'should show a post title' do
      expect(page).to have_content('post 1')
    end

    it 'should show who wrote the post' do
      expect(page).to have_content('Brian')
    end

    it 'should show how many comments a post has' do
      expect(page).to have_content('Comments:1')
    end

    it 'should show how many likes a post has' do
      expect(page).to have_content('Likes:1')
    end

    it 'should show the post body' do
      expect(page).to have_content('First post')
    end

    it 'should show the username of each commentor' do
      expect(page).to have_content('Brian')
    end

    it 'should show the comment each commentor left' do
      expect(page).to have_content('Hey this is Brian. I like this work')
    end
  end
end
