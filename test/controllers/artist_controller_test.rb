require 'test_helper'

class ArtistControllerTest < ActionController::TestCase
  def setup
    @top_category = FactoryGirl.create(:category, name:'Music')
    @sub_category = FactoryGirl.create(:category,name:'Rock', category_id: @top_category.id)
    @user = FactoryGirl.create(:user,category_id: @top_category.id, sub_category_id: @sub_category.id, is_approved: true)
    @user_without_subs = FactoryGirl.create(:user, category_id: @sub_category.id, sub_category_id: @top_category.id)
    @profile_picture = FactoryGirl.create(:profile_picture, user_id: @user.id)
    @subscription = FactoryGirl.create(:subscription,user_id: @user.id)
    @event = FactoryGirl.create(:event,user_id: @user.id)
  end
  test 'Should request to ArtistController index' do
      get :index, category: @top_category.name, subcategory: @sub_category.name
      assert_response :success
      assert_equal assigns(:artists), [@user]
  end


  test 'Should request to ArtistController profile' do
      sign_in(@user)
      get :profile
      assert_response :success
      assert_equal assigns(:resource), @user
  end

  test 'Should request to ArtistController profile when subscription not present' do
      sign_in(@user_without_subs)
      get :profile
      assert_response :success
  end
  test 'Should request to ArtistController promotion' do
      get :promotion, id: @user.id
      assert_response :success
      assert_equal assigns(:events), [@event]
  end
  test 'Should request to ArtistController promotion when user without approval' do
    get :promotion, id: @user_without_subs.id
    assert_redirected_to root_path
  end
  test 'Should request to ArtistController load_subcategory' do
      sign_in(@user)
      get :load_subcategory, category_id: @top_category.id, format: 'js'
      assert_response :success
      assert_equal assigns(:subcategories), [@sub_category]
  end
end
