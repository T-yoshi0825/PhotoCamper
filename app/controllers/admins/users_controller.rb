class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
    @categories = Category.where(active_status: true)
  end

  def show
    @user = User.find(params[:id])
    @categories = Category.where(active_status: true)
  end

  def edit
    @user = User.find(params[:id])
    @categories = Category.where(active_status: true)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email, :user_id, :acount_status)
  end
end
