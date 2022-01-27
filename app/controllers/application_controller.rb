class ApplicationController < ActionController::Base

  include Pundit
  #ApplicationController.send :include, PunditHelper

  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user! # All users must be logged in redirect to lgin page
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
    def user_not_authorized
       flash[:notice] = "Sorry, You Are Not Authorized To Do This"
       redirect_to(request.referrer || root_path)
    end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :first_name, :middle_name, :last_name, :username, :birth_date])
    end
end
