class Admin::UsersController < ApplicationController
  layout "admin_application"

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.where.not(:id => current_user.id).order("id ASC")
    #authorize @users
  end

  def show
    @user = User.find(params[:id])
    #authorize @user
  end

  def new
    @user = User.new
    #authorize @user
  end

  def create
    @user = User.new(user_params)
    #authorize @user
    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to admin_users_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    #authorize @user
  end

  def update
    @user = User.find(params[:id])
    #authorize @user
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?

    if @user.update(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to admin_users_path
    else
      render :action => 'edit'
    end
  end

  #def destroy
  #  @user.destroy
  #  redirect_to admin_users_path
    #@user = User.find(params[:id])
    #authorize @user
    #if @user.destroy
    #  flash[:notice] = "Successfully deleted User."
    #  redirect_to admin_users_path
    #else
    #  redirect_to admin_users_path, flash: { error: "User could not be deleted." }
    #end
  #end
  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
     params.require(:user).permit(:avatar, :first_name, :middle_name, :last_name, :username, :email, :role_id, :birth_date, :password, :password_confirmation)
  end
end
