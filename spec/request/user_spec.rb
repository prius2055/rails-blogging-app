describe UsersController, type: :request do
  describe '#index' do
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
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe '#show' do
    it 'returns a successful response' do
      get '/users/1'
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get '/users/1'
      expect(response.body).to include('Here is a single user')
    end
  end
end
