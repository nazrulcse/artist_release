require 'faker'
FactoryGirl.define do
  factory :profile_picture do
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'test', 'support', 'users', 'images', 'logo_image.png'))
  end
end