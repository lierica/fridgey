class FrozenServingsController < ApplicationController

	def new
		@frozen_serving = FrozenServing.new
		@recipes = Recipe.all
		@fridge = Fridge.find(params[:fridge_id])
	end

	def create
		@fridge = Fridge.find(params[:fridge_id])
		@frozen_serving = FrozenServing.create(recipe_id: params[:frozen_serving][:recipe_id], fridge_id: params[:fridge_id], date_in: params[:frozen_serving][:date_in])
		redirect_to fridge_path(@fridge)
	end

	# private
  #
	# def frozen_serving_params
	# 	params.require(:frozen_serving).permit(fridge_id:, {frozen_serving: :recipe_id, :date_in})
	# end
end
