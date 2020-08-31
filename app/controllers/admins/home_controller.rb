class Admins::HomeController < ApplicationController

	def top
		@categories = Category.where(active_status: :true)
	end
	
end
