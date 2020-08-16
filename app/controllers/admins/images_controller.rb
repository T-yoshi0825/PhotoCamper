class Admins::ImagesController < ApplicationController

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
		@all_ranks = Image.find(Favorite.group(:image_id).order('count(image_id) desc').limit(5).pluck(:image_id))
		@all_ranks = Image.all
	end

	def show
		@image = Image.find(params[:id])
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
		params.require(:image).permit(:image, :caption, :comment)
	end
	
end
