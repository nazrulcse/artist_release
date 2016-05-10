class ArtistController < ApplicationController
  def index
  end

  def profile
    @resource = current_user
  end

  def load_subcategory
     category =  Category.find_by_id(params[:category_id])
    @subcategories = category.sub_categories
  end

end
