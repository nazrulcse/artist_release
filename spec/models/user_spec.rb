require 'rails_helper'

RSpec.describe User, type: :model do


  describe 'User :full_name' do
    before(:each) do
      @user = User.create!(email: 'testfull@gmail.com', password: '123456789',first_name: 'xyz', last_name: 'xyz')
      @user_with_last_name = User.create!(email: 'test@gmail.com', password: '123456789', last_name: 'xyz')
      @user_with_first_name = User.create!(email: 'test1@gmail.com', password: '123456789', first_name: 'xyz')
      @user_with_profile_picture = User.create!(email: 'test2@gmail.com', password: '123456789', first_name: 'xyz')
      @profile_picture = ProfilePicture.create!(user_id: @user_with_profile_picture.id, image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'users', 'images', 'logo_image.png')))
    end

    it 'Should return full_name with both firstname and lastname' do
      expect(@user.full_name).should_not nil
      expect(@user.full_name).to eq(@user.first_name << ' ' << @user.last_name)
    end

    it 'Should return full_name without firstname' do
      expect(@user_with_last_name.full_name).should_not nil
      expect(@user_with_last_name.full_name).to eq(@user_with_last_name.last_name)
    end

    it 'should return full_name without lastname' do
      expect(@user_with_first_name.full_name).should_not nil
      expect(@user_with_first_name.full_name).to eq(@user_with_first_name.first_name)
    end

    it 'Should return user default profile image' do
      expect(@user_with_last_name.profile_image).should_not nil
      expect(@user_with_last_name.profile_image).to eq('profile_image.png')
    end
    it 'Should return user profile image' do
      expect(@user_with_profile_picture.profile_image).should_not nil
      expect(@user_with_profile_picture.profile_image).to eq('/uploads/profile_picture/image/' << @profile_picture.id.to_s << '/large_logo_image.png')
    end
  end
end
