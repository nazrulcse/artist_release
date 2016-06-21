require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @category = FactoryGirl.create(:category)
    @sub_category = FactoryGirl.create(:category, category_id: @category.id)
    @user = FactoryGirl.create(:user,category_id: @category.id, sub_category_id: @sub_category.id)
    @user_with_last_name = FactoryGirl.create(:user, first_name: nil,category_id: @category.id, country: nil)
    @user_with_first_name = FactoryGirl.create(:user, last_name: nil,sub_category_id: @sub_category.id, estate: nil)
    @user_with_profile_picture = FactoryGirl.create(:user)
    @profile_picture = FactoryGirl.create(:profile_picture, user_id: @user_with_profile_picture.id)
    # @category = Category.create!(name:'Music', description: 'Something')
    # @sub_category = Category.create!(name:'Rok', description: 'Something', category_id: @category.id)
    # @user = User.create!(email: 'testfull@gmail.com', password: '123456789', first_name: 'xyz', last_name: 'xyz', country: 'Bangladesh', estate: 'Dhaka', category_id: @category.id, sub_category_id: @sub_category.id)
    # @user_with_last_name = User.create!(email: 'test@gmail.com', password: '123456789', last_name: 'xyz', estate: 'dhaka', category_id: @category.id)
    # @user_with_first_name = User.create!(email: 'test1@gmail.com', password: '123456789', first_name: 'xyz', country: 'Bangaldesh', sub_category_id: @sub_category.id)
    # @user_with_profile_picture = User.create!(email: 'test2@gmail.com', password: '123456789', first_name: 'xyz')
    # @profile_picture = ProfilePicture.create!(user_id: @user_with_profile_picture.id, image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'users', 'images', 'logo_image.png')))
  end

  # test 'should send welcome email' do
  #   @user.send(:send_welcome_email)
  #   ActionMailer::Base.deliveries.first.subject.should eq('Welcome To New Artist Release')
  # end

  test 'Should return full_name with both first name and last name' do
    assert_not_equal @user.full_name, nil
    assert_equal @user.full_name, @user.first_name + ' ' + @user.last_name
  end

  test 'Should return full_name without firstname' do
    assert_not_equal @user_with_last_name.full_name, nil
    assert_equal @user_with_last_name.full_name, @user_with_last_name.last_name
  end

  test 'should return full_name without last name' do
    assert_not_equal @user_with_first_name.full_name, nil
    assert_equal @user_with_first_name.full_name, @user_with_first_name.first_name
  end

  test 'Should return user default profile image' do
    assert_not_equal @user_with_last_name.profile_image, nil
    assert_equal @user_with_last_name.profile_image, 'profile_image.png'
  end

  test 'Should return user profile image' do
    assert_not_equal @user_with_profile_picture.profile_image, nil
    assert_equal @user_with_profile_picture.profile_image, '/uploads/profile_picture/image/' << @profile_picture.id.to_s << '/large_logo_image.png'
  end

  test 'Should return short address' do
    assert_not_equal @user.short_address, nil
    assert_equal @user.short_address, @user.estate + ', ' + @user.country
  end

  test 'Should return short address without country' do
    assert_not_equal @user_with_last_name.short_address, nil
    assert_equal @user_with_last_name.short_address, @user_with_last_name.estate
  end

  test 'Should return short address without state' do
    assert_not_equal @user_with_first_name.short_address, nil
    assert_equal @user_with_first_name.short_address, @user_with_first_name.country
  end

  test 'Should return short track' do
    assert_not_equal @user.track, nil
    assert_equal @user.track, "#{@sub_category.name}, #{@category.name}"
  end

  test 'Should return short address without sub_category' do
    assert_not_equal @user_with_last_name.track, nil
    assert_equal @user_with_last_name.track, @category.name
  end

  test 'Should return short address without category' do
    assert_not_equal @user_with_first_name.track, nil
    assert_equal @user_with_first_name.track, @sub_category.name
  end
end
