class RecipesController < ApplicationController

	def index
	end

	def edit
	end

	def update
	end

	private
	def recipe_params
		params,require(:recipe), parmit()
	end
end
