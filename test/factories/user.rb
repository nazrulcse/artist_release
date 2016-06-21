require 'faker'
FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) { |n| "test#{n}@auth_forum.com"}
    password 'password'
    first_name Faker::Name.first_name
    last_name  Faker::Name.first_name
    city Faker::Address.city
    country Faker::Address.country
    estate Faker::Address.state
  end
end