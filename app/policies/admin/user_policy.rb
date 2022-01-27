class Admin::UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    raise Pundit::NotAuthorizedError, "must be logged in with a user account" unless (current_user.admin? or current_user.manager?)
    @current_user = current_user
    @user = user
  end

  def index?
    @current_user.admin? or @current_user.manager?
  end

  def show?
    @current_user.admin? or @current_user.manager?
  end

  def create?
    @current_user.admin?
  end

  def edit?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    @current_user.admin?
  end
end
