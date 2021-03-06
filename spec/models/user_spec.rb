require 'rails_helper'

RSpec.describe User, type: :model do


  describe 'User' do
    before(:each) do
      @category = Category.create!(name:'Music', description: 'Something')
      @sub_category = Category.create!(name:'Rok', description: 'Something', category_id: @category.id)
      @user = User.create!(email: 'testfull@gmail.com', password: '123456789', first_name: 'xyz', last_name: 'xyz', country: 'Bangladesh', estate: 'Dhaka', category_id: @category.id, sub_category_id: @sub_category.id)
      @user_with_last_name = User.create!(email: 'test@gmail.com', password: '123456789', last_name: 'xyz', estate: 'dhaka', category_id: @category.id)
      @user_with_first_name = User.create!(email: 'test1@gmail.com', password: '123456789', first_name: 'xyz', country: 'Bangaldesh', sub_category_id: @sub_category.id)
      @user_with_profile_picture = User.create!(email: 'test2@gmail.com', password: '123456789', first_name: 'xyz')
      @profile_picture = ProfilePicture.create!(user_id: @user_with_profile_picture.id, image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'users', 'images', 'logo_image.png')))
    end

    it 'should send welcome email' do
      @user.send(:send_welcome_email)
      ActionMailer::Base.deliveries.first.subject.should eq('Welcome To New Artist Release')
    end

    it 'Should return full_name with both first name and last name' do
      expect(@user.full_name).should_not nil
      expect(@user.full_name).to eq(@user.first_name << ' ' << @user.last_name)
    end

    it 'Should return full_name without firstname' do
      expect(@user_with_last_name.full_name).should_not nil
      expect(@user_with_last_name.full_name).to eq(@user_with_last_name.last_name)
    end

    it 'should return full_name without last name' do
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

    it 'Should return short address' do
      expect(@user.short_address).should_not nil
      expect(@user.short_address).to eq(@user.estate << ', ' << @user.country)
    end

    it 'Should return short address without country' do
      expect(@user_with_last_name.short_address).should_not nil
      expect(@user_with_last_name.short_address).to eq(@user_with_last_name.estate)
    end

    it 'Should return short address without state' do
      expect(@user_with_first_name.short_address).should_not nil
      expect(@user_with_first_name.short_address).to eq(@user_with_first_name.country)
    end

    it 'Should return short track' do
      expect(@user.track).should_not nil
      expect(@user.track).to eq("#{@sub_category.name}, #{@category.name}")
    end

    it 'Should return short address without sub_category' do
      expect(@user_with_last_name.track).should_not nil
      expect(@user_with_last_name.track).to eq(@category.name)
    end

    it 'Should return short address without category' do
      expect(@user_with_first_name.track).should_not nil
      expect(@user_with_first_name.track).to eq(@sub_category.name)
    end
  end
end
