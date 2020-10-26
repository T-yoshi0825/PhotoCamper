class Admins::ImagesController < ApplicationController
  before_action :authenticate_admin!
  before_action :get_user_and_category, only: %i[new index favorite access show edit]

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if	@image.save
      redirect_to images_path
    else
      @categories = Category.where(active_status: true)
      render :new
    end
  end

  def index
    @images = Image.all
    @images = Image.order(impressions_count: 'DESC').order(created_at: :desc)
    # order(created_at: :desc)=最新投稿順
  end

  def favorite
    @images = Image.all.sort { |a, b| b.favorited_users.count <=> a.favorited_users.count }
  end

  def access
    @images = Image.order(impressions_count: 'DESC')
  end

  def show
    @image = Image.find(params[:id])
    @images = Image.all
    @comment = Comment.new
    impressionist(@image, nil, unique: %i[impressionable_id ip_address])
    # impressionist(@image, nil, unique: [:session_hash])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if	@image.update(image_params)
      redirect_to image_path(@image)
    else
      @categories = Category.where(active_status: true)
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:image, :address, :title, :latitude, :longitude, :caption, :comment, :category_id)
  end

  def get_user_and_category
    @user = current_user
    @categories = Category.where(active_status: true)
  end

end
