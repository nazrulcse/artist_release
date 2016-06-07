require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  before(:each) do
    @user = User.create!(email: 'test@gmail.com', password: '123456789', last_name: 'xyz')
  end

  describe 'get :index' do
    it 'Should request to index' do
      get :index
      expect(response).to be_success
    end
  end
  describe 'get :search' do
    it 'Should request to search' do
      get :search
      expect(response).to be_success
    end
  end
  describe 'get :promotion' do
    it 'Should request to promotion' do
      get :promotion, artist: @user.id
      expect(response).to be_success
      expect(assigns(:artist)).to eq(@user)
    end
  end
end
