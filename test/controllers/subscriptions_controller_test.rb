require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  def setup
    @subscription = FactoryGirl.create(:subscription)
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end
  test 'Should request to new method' do
    get :new
    assert_response :success
  end
  test 'Should request to delete method' do
    delete :destroy, id: @subscription.id
    assert_response :success
  end
end
