class FridgesController < ApplicationController

	def new
		@fridge = Fridge.new
	end

	def create
		Fridge.create(fridge_params)
		redirect_to fridge_path(@fridge)
	end

	def show
		@previous_selection = params[:sort]
		@fridge = Fridge.find(params[:id])
		@fridge_ingredients = @fridge.sort_fridge_ingredients(params[:sort])
		@frozen_servings = @fridge.sort_frozen_servings(params[:sort])
		@expired_frozen_servings = []
		@expired_fridge_ingredients = []
	end

	private

	def fridge_params
		params.require(:fridge).permit(*args)
	end

end
