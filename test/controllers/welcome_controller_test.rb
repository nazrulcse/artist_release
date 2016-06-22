require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  def setup
    @user = FactoryGirl.create(:user)
  end
  test 'Should request to index' do
    get :index
    assert_response :success

  end
  test 'Should request to search' do
    get :search
    assert_response :success
  end
  test 'Should request to promotion' do
    get :promotion, artist: @user.id
    assert_response :success
    assert_equal assigns(:artist) , @user
  end

end
