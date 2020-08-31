class HomeController < ApplicationController

	def top
		@categories = Category.where(active_status: :true)
    end
    
    def about
    	@categories = Category.where(active_status: :true)
    end
    
end
