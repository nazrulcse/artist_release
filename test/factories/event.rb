require 'faker'
FactoryGirl.define do
  factory :event do
    title Faker::Name.title
    date Faker::Date.between(1.days.ago, Date.today)
    location Faker::Address.street_address
    description Faker::Lorem.sentence
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'support', 'users', 'images', 'logo_image.png'))
    lat Faker::Address.latitude
    lng Faker::Address.longitude
    country Faker::Address.country
    state Faker::Address.state
  end
end