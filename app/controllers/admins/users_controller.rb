class Admins::UsersController < ApplicationController

    def index
    	@users = User.all
    end

	def show
	   	@user = User.find(params[:id])
	   	@user = current_user
    end

    def edit
	   	@user = User.find(params[:id])
	   	@user = User.new
    end

    def update
	   	@user = User.find(params[:id])
	   	@user.update(user_params)
	   	redirect_to user_path(user)
    end

    private
      def user_params
      params.require(:user).permit(:name, :profile_image, :email, :user_id, :acount_status)
      end

end
