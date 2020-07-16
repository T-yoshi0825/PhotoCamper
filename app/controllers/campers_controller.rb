class CampersController < ApplicationController

	def index
	end

	def edit
	end

	def update
	end

	private
	def camper_params
		params,require(:camper), parmit()
	end
end
