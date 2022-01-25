class Admin::DashboardPolicy < ApplicationPolicy
  def index?
    is_admin?
  end
end
