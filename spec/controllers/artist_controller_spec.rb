require 'rails_helper'

RSpec.describe ArtistController, type: :controller do
  before(:each) do
    @top_category = Category.create!(name:'Music', description: 'Something')
    @sub_category = Category.create!(name:'Rock', description: 'Something', category_id: @top_category.id)
    @user = User.create!(email: 'test@gmail.com', password: '123456789', last_name: 'xyz', category_id: @top_category.id, sub_category_id: @sub_category.id)
    @event = Event.create!(title: 'Event Name',date: Date.today.to_s,location: 'Dhaka', country: 'Bangladesh', user_id: @user.id)
  end
  describe 'get :index' do
      it 'Should request to ArtistController index' do
        get :index, category: @top_category.name, subcategory: @sub_category.name
        expect(response).to be_success
        expect(assigns(:artists)).to eq([@user])
      end
  end

=begin
  describe 'get :profile' do
    it 'Should request to ArtistController profile' do
      get :profile
      expect(response).to be_success
    end
  end
=end

  describe 'get :promotion' do
    it 'Should request to ArtistController promotion' do
      get :promotion, id: @user.id
      expect(response).to be_success
      expect(assigns(:events)).to eq([@event])
    end
  end

  describe 'get :load_subcategory' do
    it 'Should request to ArtistController load_subcategory' do
      get :load_subcategory, category_id: @top_category.id, format: 'js'
      expect(response).to be_success
      expect(assigns(:subcategories)).to eq([@sub_category])
    end
  end
end
