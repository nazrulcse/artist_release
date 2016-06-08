require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'get :index' do
    it 'should request to the index of contacts' do
      get :index
      @contact_test = Contact.new
      expect(response).to be_success
    end
  end

  describe 'post :create' do
    it 'should create a contact' do
      post :create, contact: {first_name: 'Firstname', last_name: 'Lastname', email: 'email@gmail.com', message: 'some message', phone:'123456789'}.to_hash
      expect(response).to redirect_to(root_path)
      expect(Contact.all.count).to be > 0
    end
    it 'should not create a contact and return to index' do
      post :create, contact: {first_name: 'Firstname', last_name: 'Lastname', email: 'email@gmail.com', message: 'some message'}.to_hash
      expect(response).to be_success
      expect(Contact.all.count).to eq(0)
    end
  end
end

