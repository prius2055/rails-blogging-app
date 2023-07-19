describe PostsController, type: :request do
  describe '#index' do
    it 'returns a successful response' do
      get "/users/1/posts"
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get "/users/1/posts"
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get "/users/1/posts"
      expect(response.body).to include('Here is a list of all posts for a given user')
    end
  end

  describe '#show' do
    it 'returns a successful response' do
      get "/users/1/posts/1"
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get "/users/1/posts/1"
      expect(response).to render_template(:show)
    end

     it 'includes correct placeholder text in the response body' do
      get "/users/1/posts/1"
      expect(response.body).to include('Here is a specific post for a single user')
    end
  end
end