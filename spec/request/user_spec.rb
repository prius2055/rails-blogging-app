describe UsersController, type: :request do
  describe '#index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to be_successful
    end
  end
end