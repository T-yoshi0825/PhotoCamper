class Admins::CategoriesController < ApplicationController
  before_action :authenticate_admin!, only: %i[index create edit update]

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admins_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.where(active_status: true)
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admins_categories_path
    else
      @categories = Category.where(active_status: true)
      render :edit
    end
  end

  private

  def category_params
    params.require(:category). permit(:name, :active_status, :image_id)
  end
end
