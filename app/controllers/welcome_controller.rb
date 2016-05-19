class WelcomeController < ApplicationController

  def index
    #@user = User.order("RAND(id)").first
  end

  def promotion
    @artist = User.find_by_id(params[:artist])
  end

end
