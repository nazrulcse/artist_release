require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @user = FactoryGirl.create(:user)
    @event = FactoryGirl.create(:event, user_id: @user.id)
    #@event_after_edit = Event.new
    sign_in(@user)
  end

  test 'should request index' do
    get :index
    assert_response :success
    assert_equal assigns(:events), [@event]
  end

  test 'should request new' do
    get :new
    assert_response :success
    assert_instance_of Event, assigns(:event)
  end

  test 'should request create successful' do
    post :create, event:{title: 'Event Name',date: Date.today.to_s,location: 'Dhaka', country: 'Bangladesh', user_id: @user.id}.to_hash
    assert_response :redirect
    assert_redirected_to assigns(:event)
  end

  test 'should request create unsuccessful' do
    post :create, event:{title: 'Event Name', location: 'Dhaka', country: 'Bangladesh', user_id: @user.id}.to_hash
    assert_response :success
  end

  test 'should request show' do
    get :show, id: @event.id
    assert_response :success
    assert_equal assigns(:artist), @user
  end

  test 'should request edit' do
    put :edit, id: @event.id, event:{title: 'New Event Title'}.to_hash
    assert_response :success
    assert_equal assigns(:event), @event
  end

  test 'should request update successful' do
    put :update, id: @event.id, event:{title: 'New Event Name',date: Date.today.to_s,location: 'Dhaka', country: 'Bangladesh', user_id: @user.id}.to_hash
    assert_response :redirect
    assert_redirected_to assigns(:event)
  end

  test 'should request update unsuccessful' do
    put :update, id: @event.id, event:{title: '',country: 'Bangladesh'}.to_hash
    assert_response :success
  end

  test 'Should request destroy' do
    delete :destroy, id: @event.id
    assert_response :redirect
    assert_redirected_to events_path
  end
end