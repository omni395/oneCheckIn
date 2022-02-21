class Admin::ArticlePolicy < ApplicationPolicy
  attr_reader :current_user, :article

  def initialize(current_user, article)
    raise Pundit::NotAuthorizedError, "must be logged in with a user account" unless (current_user.admin? or current_user.manager?)
    @current_user = current_user
    @article = article
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    @current_user.manager? || @current_user.admin?
  end

  def edit?
    @current_user.manager? || @current_user.admin?
  end

  def update?
    @current_user.manager? || @current_user.admin?
  end

  def destroy?
    @current_user.manager? || @current_user.admin?
  end
end
