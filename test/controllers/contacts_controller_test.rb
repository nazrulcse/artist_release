require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
    test 'should request to the index of contacts' do
      get :index
      @contact_test = Contact.new
      assert_response :success
    end

    test 'should create a contact' do
      post :create, contact: {first_name: 'Firstname', last_name: 'Lastname', email: 'email@gmail.com', message: 'some message', phone:'123456789'}.to_hash
      assert_response :redirect
      assert_redirected_to root_path
      assert_operator Contact.all.count, :>, 0
    end
    test 'should not create a contact and return to index' do
      post :create, contact: {first_name: 'Firstname', last_name: 'Lastname', email: 'email@gmail.com', message: 'some message'}.to_hash
      assert_response :success
      assert_operator Contact.all.count, :>,0
    end
end
