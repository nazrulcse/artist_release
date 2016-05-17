class WelcomeController < ApplicationController

  def index
    @user = User.order("RAND(id)").first
  end
end
