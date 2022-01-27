class Admin::DashboardController < ApplicationController
  layout "admin_application"

  def index
    @users = User.where.not(:id => current_user.id) #without current_user
    authorize [:admin, :dashboard], :index?
  end
end
