require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  before (:each) do
    @user = User.create!(email: 'test1@gmail.com', password: '123456789',first_name:'xyz', last_name: 'xyz')
    @user_without_subscription = User.create!(email: 'test2@gmail.com', password: '123456789',first_name:'xyz', last_name: 'xyz')
    @subscription = Subscription.create!(plan: 'Regular Subscription',amount: "400",user_id:@user.id);
  end
  describe 'ApplicationController' do
    it 'should return resource name' do
      sign_in(@user)
      resource = ApplicationController.new
      expect(resource.resource_name).to eq(:user)
    end
    it 'should return resource' do
      resource = ApplicationController.new
      expect(resource.resource).to be_an_instance_of(User)
    end

    it 'should return devise mapping' do
      resource = ApplicationController.new
      expect(resource.devise_mapping).to be_an_instance_of(Devise::Mapping)
    end

    it 'should return after sign in path'do
      sign_in(@user)
      application_obj = ApplicationController.new
      controller.after_sign_in_path_for(@user).should == profile_path
    end
    it 'should return after sign in path'do
      sign_in(@user_without_subscription)
      application_obj = ApplicationController.new
      controller.after_sign_in_path_for(@user_without_subscription).should == new_subscription_path
    end
  end
end
