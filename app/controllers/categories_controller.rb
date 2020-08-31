class CategoriesController < ApplicationController

	def show
		@user = current_user
		@category = Category.find(params[:id])
		@images = @category.images
		@categories = Category.where(active_status: :true)
	end

	private
    def category_params
    	params.require(:category). permit(:name, :active_status, :image_id)
    end
    
end
