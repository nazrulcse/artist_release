require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  before(:each) do
    @subscription = Subscription.create!(plan: 'Regular Subscription',amount: "400");
  end
  describe 'SubscriptionController' do
      it 'Should request to new method' do
        get :new
        expect(response).to be_success
      end
=begin
      it 'Should request to create method' do
        post :create
        expect(response).to be_success
      end
=end
    it 'Should request to delete method' do
      delete :destroy, id: @subscription.id
      expect(response).to be_success
    end
  end
end
