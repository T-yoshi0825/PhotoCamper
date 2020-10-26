class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!, only: %i[edit update]

  def show
    @user = User.find(params[:id])
    @images = current_user.images.all
    @categories = Category.where(active_status: true)
  end

  def edit
    @user = User.find(params[:id])
    @categories = Category.where(active_status: true)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      @categories = Category.where(active_status: true)
      render :edit
    end
  end

  def check
    @user = User.find(params[:id])
  end

  def withdrawl
    @user = User.find(current_user.id)
    # 現在ログインしているユーザーを@userに格納
    @user.acount_status = false
    # acount_statusをfalseに変換
    @user.update(is_active: 'Invalid')
    # updateで登録情報をInvalidに変更
    reset_session
    # sessionIDのresetを行う
    redirect_to root_path
    # 指定されたrootへのpath
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :email, :active)
  end

end
