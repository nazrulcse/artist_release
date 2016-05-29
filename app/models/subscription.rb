class Subscription < ActiveRecord::Base
  belongs_to :user

  def self.subscription_plans
    {
        'Regular Subscription' => 99,
        'Additional Services: EPK (Electronic Press Kit)' => 59
    }
  end

  def self.get_stripe_plan_from_value(subscription)
    case subscription
      when 9900
        'Regular_Subscription'
      when 45900
        'EPK_Subscription'
    end
  end
end
