require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  before (:each) do
    @user = User.create!(email: 'test@gmail.com', password: '123456789',first_name:'xyz', last_name: 'xyz')
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
  end
end
