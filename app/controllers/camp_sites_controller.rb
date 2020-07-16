class CampSitesController < ApplicationController

	def index
	end

	def edit
	end

	def update
	end

	private
	def camp_site_params
		params,require(:camp_site), parmit()
	end

end
