require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success and view' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('List of post by a user')
    end
  end

  describe 'GET /show' do
    it 'returns http success and view' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Posts of specific user')
    end
  end
end
