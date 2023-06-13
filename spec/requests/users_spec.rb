require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('List of users')
    end
  end

  describe 'GET /show' do
    it 'return http success' do
      get '/users/:id'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('List of users by id')
    end
  end
end
