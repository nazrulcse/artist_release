require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
    @user_without_subscription = FactoryGirl.create(:user)
    @subscription = FactoryGirl.create(:subscription, user_id:@user.id)
  end

  test 'should return resource name' do
    sign_in(@user)
    resource = ApplicationController.new
    assert_equal resource.resource_name, :user
  end
  test 'should return resource' do
    resource = ApplicationController.new
    assert_instance_of User, resource.resource
  end

  test 'should return devise mapping' do
    resource = ApplicationController.new
    assert_instance_of Devise::Mapping, resource.devise_mapping
  end

  # test 'should return after sign in path'do
  #   sign_in(@user)
  #   application_obj = ApplicationController.new
  #   #assert_equal application_obj.after_sign_in_path_for(@user), profile_path.to_s
  # end
  #
  # test 'should return after sign in path new subscription path'do
  #   sign_in(@user_without_subscription)
  #   application_obj = ApplicationController.new
  #   #assert_equal application_obj.after_sign_in_path_for(@user_without_subscription), '' #new_subscription_path.to_s
  # end
  #
  # test "should return subscribed user true" do
  #   sign_in(@user)
  #   tag = ApplicationController.new
  #   assert_equal tag.subscribed_user, true
  # end
  # test "should return subscribed user subscription path" do
  #   sign_in(@user_without_subscription)
  #   tag = ApplicationController.new
  #   assert_redirected_to new_subscription_path
  # end
  # test "should return subscribed user false" do
  #   tag = ApplicationController.new
  #   assert_equal tag.subscribed_user, false
  # end
end
