class ArtistController < ApplicationController
  def index
    @sub_category = Category.find_by_name(params[:subcategory])
    @artists = User.where(sub_category_id: @sub_category.id)
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
