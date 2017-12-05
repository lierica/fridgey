class FrozenServingsController < ApplicationController

	def new
		@frozen_serving = FrozenServing.new
		@recipes = Recipe.all
		@fridge = Fridge.find(params[:id])
	end

	def create
		byebug
		@frozen_serving = FrozenServing.create(frozen_serving_params)
	end

	private

	def frozen_serving_params
		params.require[:frozen_serving].permit(*args)
	end
end
