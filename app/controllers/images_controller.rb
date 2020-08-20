class ImagesController < ApplicationController

	def new
        @image = Image.new
        @categories = Category.where(active_status: :true)
    end

    def create
		@image = Image.new(image_params)
		@image.user_id = current_user.id
		@image.save
		redirect_to images_path
	end

	def index	
		@images = Image.all
		@categories = Category.where(active_status: :true)
	end

	def show
		@image = Image.find(params[:id])
		@images = Image.all
		@comment = Comment.new
	end

	def edit
		@image = Image.find(params[:id])
	end

	def update
		@image = Image.find(params[:id])
		@image.update(image_params)
		redirect_to image_path(@image)
	end

	def destroy
		@image = Image.find(params[:id])
		@image.destroy
		redirect_to images_path
	end

	private
	def image_params
		params.require(:image).permit(:image, :address, :latitude, :longitude, :caption, :comment, :category_id)
	end
end
