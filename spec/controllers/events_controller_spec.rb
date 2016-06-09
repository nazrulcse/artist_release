require 'rails_helper'
include Devise::TestHelpers

RSpec.describe EventsController, type: :controller do
  before(:each) do
    @user = User.create!(email: 'test@gmail.com', password: '123456789', last_name: 'xyz')
    @event = Event.create!(title: 'Event Name',date: Date.today.to_s,location: 'Dhaka', country: 'Bangladesh', user_id: @user.id)
    sign_in(@user)
  end
  describe 'EventsController' do
    it 'should request to index of eventController' do
      get :index
      expect(response).to be_success
    end

    it 'should request to new of eventController' do
      get :new
      expect(response).to be_success
    end

    it 'should request to create of eventController' do
      post :create, event:{title: 'Event Name',date: Date.today.to_s,location: 'Dhaka', country: 'Bangladesh', user_id: @user.id}.to_hash
      expect(response).to redirect_to(Event.last)
    end

    it 'should request to create of eventController unsuccessful' do
      post :create, event:{title: 'Event Name', country: 'Bangladesh',user_id: @user.id}.to_hash
      expect(response).to be_success
    end

    it 'should request to edit of eventController' do
      get :edit, id: @event.id
      expect(assigns(:event)).to eq(@event)
    end

    it 'should request to update of eventController' do
      put :update, id: @event.id, event:{title: 'Event',date: Date.today.to_s,location: 'Dhaka', country: 'Bangladesh', user_id: @user.id}
      expect(response).to redirect_to(Event.last)
    end

    it 'should render edit' do
      put :update, id: @event.id, event:{title: '', country: 'Bangladesh'}
      expect(response).to be_success
    end

    it 'should destroy event' do
      delete :destroy, id: @event.id
      expect(response).to redirect_to(events_path)
    end

    it 'should request to show of eventController' do
      get :show, id: @event.id
      expect(response).to be_success
      expect(assigns(:artist)).to eq(@user)
    end

  end
end
