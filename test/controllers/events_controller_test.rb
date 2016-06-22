require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @user = FactoryGirl.create(:user)
    @event = FactoryGirl.create(:event,user_id: @user.id)
    sign_in(@user)
  end
  test 'should request to index of eventController' do
    get :index
    assert_response :success
  end

  test 'should request to new of eventController' do
    get :new
    assert_response :success
  end

  test 'should request to create of eventController' do
    post :create, event:{title: 'Event Name',date: Date.today.to_s,location: 'Dhaka', country: 'Bangladesh', user_id: @user.id}.to_hash
    assert_redirected_to Event.last
  end

  test 'should request to create of eventController unsuccessful' do
    post :create, event:{title: 'Event Name', country: 'Bangladesh',user_id: @user.id}.to_hash
    assert_response :success
  end

  test 'should request to edit of eventController' do
    get :edit, id: @event.id
    assert_equal assigns(:event), @event
  end

  test 'should request to update of eventController' do
    put :update, id: @event.id, event:{title: 'Event',date: Date.today.to_s,location: 'Dhaka', country: 'Bangladesh', user_id: @user.id}
    assert_redirected_to Event.last
  end

  test 'should render edit' do
    put :update, id: @event.id, event:{title: '', country: 'Bangladesh'}
    assert_response :success
  end

  test 'should destroy event' do
    delete :destroy, id: @event.id
    assert_redirected_to events_path
  end

  test 'should request to show of eventController' do
    get :show, id: @event.id
    assert_response :success
    assert_equal assigns(:artist), @user
  end
end
