require 'rails_helper'

RSpec.describe Subscription, type: :model do
  before(:each) do
    @subscription = Subscription.create!(plan: 'Regular Subscription',amount: "400");
  end
  describe 'Subscription' do
    it 'Should return subscriptions plans nature' do
      expect(Subscription.subscription_plans).should_not nil
      expect(Subscription.subscription_plans.length).to be > 0
    end

    it 'Should receive subscription and return stripe plan' do
        expect(Subscription.get_stripe_plan_from_value(9900)).to eq('Regular_Subscription')
        expect(Subscription.get_stripe_plan_from_value(45900)).to eq('EPK_Subscription')
    end
    it 'Should return nill on garbage' do
        expect(Subscription.get_stripe_plan_from_value(99004)).to eq(nil)
    end



  end
end
