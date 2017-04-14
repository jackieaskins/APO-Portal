class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    keys = [:first_name, :last_name, :preferred_name, :pledge_class_id, :lineage_id, :campus_address, :phone_number, :graduation_year, :graduation_semester, :school, :major, :minor, :birthday]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end
end
