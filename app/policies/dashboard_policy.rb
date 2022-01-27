class DashboardPolicy < ApplicationPolicy
  attr_reader :current_user

  def initialize(current_user, model)
    @current_user = current_user
  end

  def index?
    false
  end

  def user?
    @urrent_user == current_user
  end
end
