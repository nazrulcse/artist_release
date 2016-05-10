class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :resource, :resource_name, :devise_mapping

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name,  :email, :password, :password_confirmation,:last_name)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name,:current_password,  :email, :password, :password_confirmation,:last_name,:country, :city, :estate, :image, :category_id, :sub_category_id)
    end

    devise_parameter_sanitizer.permit(:sign_in) do |u|
      u.permit(:email, :password)
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
