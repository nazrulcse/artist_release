require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  setup do
    @user = FactoryGirl.create(:user)
    @user_without_subscription = FactoryGirl.create(:user);
    # @user = User.create!(email: 'test1@gmail.com', password: '123456789',first_name:'xyz', last_name: 'xyz')
    # @user_without_subscription = User.create!(email: 'test2@gmail.com', password: '123456789',first_name:'xyz', last_name: 'xyz')
    # @subscription = Subscription.create!(plan: 'Regular Subscription',amount: "400",user_id:@user.id);
  end
    test 'should return resource name' do
      sign_in(@user)
      resource = ApplicationController.new
      assert_equal resource.resource_name, @user
    end
    test 'should return resource' do
      resource = ApplicationController.new
      assert_equal resource.resource_name, @user
      expect(resource.resource).to be_an_instance_of(User)
    end

    test 'should return devise mapping' do
      resource = ApplicationController.new
      expect(resource.devise_mapping).to be_an_instance_of(Devise::Mapping)
    end

    test 'should return after sign in path'do
      sign_in(@user)
      application_obj = ApplicationController.new
      controller.after_sign_in_path_for(@user).should == profile_path
    end
    test 'should return after sign in path when user without subscription'do
      sign_in(@user_without_subscription)
      application_obj = ApplicationController.new
      controller.after_sign_in_path_for(@user_without_subscription).should == new_subscription_path
    end
end
