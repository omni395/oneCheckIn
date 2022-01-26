class Admin::UsersController < ApplicationController
  layout "admin_application"

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.where.not(:id => current_user.id).order("id ASC")
    @user = User.new
    #authorize @users
  end

  def create
    @user = User.new(user_params)
    #authorize @user
    #if @user.save
    #  flash[:notice] = "Successfully created User."
    #  redirect_to admin_users_path
    #else
    #  render :action => 'new'
    #end
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

  def destroy
      @user = User.find(params[:id])
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
     params.require(:user).permit(:avatar, :first_name, :middle_name, :last_name, :username, :email, :role_id, :birth_date, :password, :password_confirmation)
  end
end
