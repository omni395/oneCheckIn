class Admin::UserPolicy < ApplicationPolicy

  def index?
    is_admin?
  end

  def show?
    is_admin? or @current_user == @user
  end

  def edit?
    is_admin? or @current_user == @user
  end

  def update?
    is_admin? or @current_user == @user
  end

  def destroy?
    return false if @current_user == @user
    is_admin?
  end

  private
    def is_admin?
      current_user.role.name == "Admin"
    end

end
