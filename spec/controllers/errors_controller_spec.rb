require 'rails_helper'

RSpec.describe ErrorsController, type: :controller do
  before(:each) do
    @status_code_not_found = 404
    @status_code_internal_server_error = 500
  end
  describe 'get :show' do
    it 'should render the 404 status view' do
      get :show, code: @status_code_not_found
      expect(assigns(:status_code).to_i).to eq(@status_code_not_found)
    end
    it 'should render the 500 status view' do
      get :show, code: @status_code_internal_server_error
      expect(assigns(:status_code).to_i).to eq(@status_code_internal_server_error)
    end
  end
end
