class ArtistController < ApplicationController
  before_action :subscribed_user

  def index
    @sub_category = Category.where('lower(name) = ?', params[:subcategory].downcase).first
    @artists = @sub_category.users
  end

  def profile
    if current_user.subscription.present?
      @resource = current_user
      @resource.profile_pictures.build
    else
      redirect_to new_subscription_path
    end

  end

  def promotion
    @artist = User.find_by_id(params[:id])
  end

  def load_subcategory
    category = Category.find_by_id(params[:category_id])
    @subcategories = category.sub_categories
  end

end
