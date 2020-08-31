class Admins::ImagesController < ApplicationController
	before_action :authenticate_admin!

	def new
        @image = Image.new
        @categories = Category.where(active_status: :true)
    end

    def create
		@image = Image.new(image_params)
		@image.user_id = current_user.id
		if 	@image.save
		   	redirect_to images_path
		else
			@categories = Category.where(active_status: :true)
			render :new
		end
	end

	def index
		@user = current_user	
		@images = Image.all
		@categories = Category.where(active_status: :true)
		@images = Image.order(impressions_count: 'DESC').order(created_at: :desc)
		#order(created_at: :desc)=最新投稿順
	end

	def favorite
		@user = current_user
		@categories = Category.where(active_status: :true)
		@images = Image.all.sort {|a,b| b.favorited_users.count <=> a.favorited_users.count}
	end

	def access
		@user = current_user
		@categories = Category.where(active_status: :true)
		@images = Image.order(impressions_count: 'DESC')
	end

	def show
		@user = current_user
		@image = Image.find(params[:id])
		@images = Image.all
		@comment = Comment.new
		@categories = Category.where(active_status: :true)
		impressionist(@image, nil, unique: [:impressionable_id, :ip_address])
		#impressionist(@image, nil, unique: [:session_hash])
	end

	def edit
		@image = Image.find(params[:id])
		@categories = Category.where(active_status: :true)
	end

	def update
		@image = Image.find(params[:id])
		if 	@image.update(image_params)
			redirect_to image_path(@image)
		else
			@categories = Category.where(active_status: :true)
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
	
end
