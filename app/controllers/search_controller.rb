class SearchController < ApplicationController

  	def search
      @search = params[:search]
      model = params[:search]
      word = params[:option]
      @categories = Category.where(active_status: :true)
      if @search == "1"
        @users = User.search(word,model)
      else
        @images = Image.search(word,model)
      end
    end

end
