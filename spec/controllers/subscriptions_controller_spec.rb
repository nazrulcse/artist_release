require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  before(:each) do
    @subscription = Subscription.create!(plan: 'Regular Subscription',amount: "400");
  end
  describe 'get :new' do
      it 'Should request to new method' do
        get :new
        expect(response).to be_success
      end
  end
=begin
  describe 'post :create' do
      it 'Should request to create method' do
        post :create
        expect(response).to be_success
      end
  end
=end
  describe 'delete :delete' do
    it 'Should request to delete method' do
      delete :destroy, id: @subscription.id
      expect(response).to be_success
    end
  end
end
