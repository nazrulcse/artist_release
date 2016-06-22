require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  def setup
    @subscription = FactoryGirl.create(:subscription)
  end
  test 'Should return subscriptions plans nature' do
    assert_not_equal Subscription.subscription_plans, nil
    assert_operator Subscription.subscription_plans.length, :> , 0
  end

  test 'Should receive subscription and return stripe plan' do
    assert_equal Subscription.get_stripe_plan_from_value(9900), 'Regular_Subscription'
    assert_equal Subscription.get_stripe_plan_from_value(45900), 'EPK_Subscription'
  end
  test 'Should return nill on garbage' do
    assert_nil Subscription.get_stripe_plan_from_value(99004)
  end
end
