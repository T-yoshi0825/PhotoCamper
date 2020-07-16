class UsersController < ApplicationController

   def show
   end

   def edit
   end

   def update
   end

   private
     def user_params
     params.require(:user),permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :profile_image, :email, :password)
     end
end
