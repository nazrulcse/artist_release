require 'rails_helper'
include Devise::TestHelpers

RSpec.describe EventsController, type: :controller do
  before(:each) do
    @user = User.create!(email: 'test@gmail.com', password: '123456789', last_name: 'xyz')
    @event = Event.create!(title: 'Event Name',date: Date.today.to_s,location: 'Dhaka', country: 'Bangladesh', user_id: @user.id)
    sign_in(@user)
  end
  describe 'get :index' do
    it 'should request to index of eventController' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'get :new' do
    it 'should request to new of eventController' do
      get :new
      expect(response).to be_success
    end
  end

=begin
  describe 'post :create' do
    it 'should request to new of eventController' do
      post :create
      expect(response).to be_success
    end
  end
=end

  describe 'get :show' do
    it 'should request to new of eventController' do
      get :show, id: @event.id
      expect(response).to be_success
      expect(assigns(:artist)).to eq(@user)
    end
  end
end
