class WelcomeController < ApplicationController

  def index
    #@user = User.order("RAND(id)").first
  end

  def search
    @user_with_cat_subcat = User.joins(:category).joins(:sub_category)
    @searching_params = params[:search]
    @results = @user_with_cat_subcat.where("first_name like :search_item or last_name like :search_item or city like :search_item or country like :search_item  or bio like :search_item or categories.name like :search_item or sub_categories_users.name like :search_item", :search_item => "%#{params[:search]}%")
  end

  def promotion
    @artist = User.find_by_id(params[:artist])
  end

end
