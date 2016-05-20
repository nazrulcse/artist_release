class ArtistController < ApplicationController
  def index
    @sub_category = Category.where('lower(name) = ?', params[:subcategory].downcase).first
    @artists = @sub_category.users
  end

  def profile
    @resource = current_user
    @resource.profile_pictures.build
  end

  def load_subcategory
    category = Category.find_by_id(params[:category_id])
    @subcategories = category.sub_categories
  end

end
