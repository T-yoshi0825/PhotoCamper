class Admins::FavoritesController < ApplicationController
	before_action :authenticate_admin!, only: [:create, :destroy]

	def create
		image = Image.find(params[:image_id])
		favorite = current_user.favorites.new(image_id: image.id)
		favorite.save
		redirect_to request.referer
	end

	def destroy
		image = Image.find(params[:image_id])
		favorite = current_user.favorites.find_by(image_id: image.id)
		favorite.destroy
		redirect_to request.referer
	end
	
end
