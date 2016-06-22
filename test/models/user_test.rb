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

  end

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
  test 'should send welcome email' do
    @user.send(:send_welcome_email)
    assert_equal ActionMailer::Base.deliveries.first.subject, 'Welcome To New Artist Release'
  end
end
