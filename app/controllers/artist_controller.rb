class ArtistController < ApplicationController
  before_action :subscribed_user, only: :profile
  protect_from_forgery except: :load_subcategory

  def index
    @sub_category = Category.where('lower(name) = ?', params[:subcategory].downcase).first
    @artists = @sub_category.approved_profiles
  end

  def profile
    @resource = current_user
    @resource.profile_pictures.build
  end

  def promotion
    @artist = User.friendly.find(params[:id])
    if @artist.is_approved
      @events = @artist.events
    else
      redirect_to root_path
    end
    options = {
        title: "New Artist Release Profile #{@artist.full_name}",
        description: "#{@artist.bio.html_safe}",
        image: @artist.profile_image
    }
    prepare_meta_tags(options)
  end

  def load_subcategory
    category = Category.find_by_id(params[:category_id])
    @subcategories = category.sub_categories
  end

end
