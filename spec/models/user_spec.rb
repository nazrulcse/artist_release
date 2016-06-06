require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
   @user = User.create!(email: 'test@gmail.com', password: '123456789', last_name: 'xyz')
  end

  describe 'User' do
    it 'Should return full name' do
      expect(@user.full_name).should_not nil
      expect(@user.full_name).to eq(@user.last_name)
    end

    it 'Should return user default profile image' do
      expect(@user.profile_image).should_not nil
      expect(@user.profile_image).to eq('profile_image.png')
    end

  end
end
