class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit # Pundit authorisation

  add_flash_types :success, :danger, :info

  before_action :authenticate_user! # All users must be logged in redirect to lgin page

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :middle_name, :last_name, :username, :birth_date])
    end
end
