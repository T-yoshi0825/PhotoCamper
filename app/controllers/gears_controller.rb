class GearsController < ApplicationController

	def index
	end

	def edit
	end

	def update
	end

	private
	def gear_params
		params,require(:gear), parmit()
	end
end
