class Admin::UsersController < ApplicationController
  layout "admin_application"

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.where.not(:id => current_user.id).order("id ASC")
    @user = User.new
    authorize [:admin, User], :index?
  end

  def create
    @user = User.new(user_params)
    authorize [:admin, User], :create?

    if @user.save
      flash[:notice] = "Successfully."
      redirect_to admin_users_path
    else
      render :action => 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
    authorize [:admin, User], :edit?
  end

  def update
    @user = User.find(params[:id])
    authorize [:admin, User], :update?
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

    if @user.update(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to admin_users_path
    else
      render :action => 'edit'
    end
  end

  def destroy
      @user = User.find(params[:id])
      authorize [:admin, User], :destroy?
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: "User was successfully destroyed." }
      end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
     params.require(:user).permit(:avatar, :first_name, :middle_name, :last_name, :username, :email, :role, :birth_date, :password, :password_confirmation)
  end
end
