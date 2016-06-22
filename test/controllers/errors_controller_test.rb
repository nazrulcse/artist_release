require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  def setup
    @status_code_not_found = 404
    @status_code_internal_server_error = 500
  end
  test 'should render the 404 status view' do
    get :show, code: @status_code_not_found
    assert_equal assigns(:status_code).to_i, @status_code_not_found
  end
  test 'should render the 500 status view' do
    get :show, code: @status_code_internal_server_error
    assert_equal assigns(:status_code).to_i, @status_code_internal_server_error
  end
end
