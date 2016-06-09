require 'rails_helper'

RSpec.describe ArtistController, type: :controller do
  before(:each) do
    @top_category = Category.create!(name:'Music', description: 'Something')
    @sub_category = Category.create!(name:'Rock', description: 'Something', category_id: @top_category.id)
    @user = User.create!(email: 'test@gmail.com', password: '123456789', last_name: 'xyz', category_id: @top_category.id, sub_category_id: @sub_category.id)
    @user_without_subs = User.create!(email: 'testsubs@gmail.com', password: '123456789', last_name: 'xyz', category_id: @sub_category.id, sub_category_id: @top_category.id)
    @profile_picture = ProfilePicture.create!(user_id: @user.id, image:Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'users', 'images', 'logo_image.png')))
    @subscription = Subscription.create!(plan: 'Regular Subscription',amount: "400", user_id: @user.id);
    @event = Event.create!(title: 'Event Name',date: Date.today.to_s,location: 'Dhaka', country: 'Bangladesh', user_id: @user.id)

  end
  describe 'ArtistController' do
      it 'Should request to ArtistController index' do
        get :index, category: @top_category.name, subcategory: @sub_category.name
        expect(response).to be_success
        expect(assigns(:artists)).to eq([@user])
      end


    it 'Should request to ArtistController profile' do
      sign_in(@user)
      get :profile
      expect(response).to be_success
      expect(assigns(:resource)).to eq(@user)
    end

    it 'Should request to ArtistController profile when subscription not present' do
      sign_in(@user_without_subs)
      get :profile
      expect(response).to redirect_to(new_subscription_path)
    end

    it 'Should request to ArtistController promotion' do
      get :promotion, id: @user.id
      expect(response).to be_success
      expect(assigns(:events)).to eq([@event])
    end

    it 'Should request to ArtistController load_subcategory' do
      get :load_subcategory, category_id: @top_category.id, format: 'js'
      expect(response).to be_success
      expect(assigns(:subcategories)).to eq([@sub_category])
    end
  end
end
