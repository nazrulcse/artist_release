require 'faker'
FactoryGirl.define do
  factory :subscription do
    plan 'Regular Subscription'
    amount Faker::Number.number(10)
  end
end