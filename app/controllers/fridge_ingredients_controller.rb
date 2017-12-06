class FridgeIngredientsController < ApplicationController

	def new
		@fridge_ingredient = FridgeIngredient.new
		@ingredients = Ingredient.all
		@fridge = Fridge.find(params[:fridge_id])
	end

	def create
		@fridge = Fridge.find(params[:fridge_id])
		@fridge_ingredient = FridgeIngredient.create(ingredient_id: params[:fridge_ingredient][:ingredient_id], fridge_id: params[:fridge_id], date_in: params[:fridge_ingredient][:date_in])
		redirect_to fridge_path(@fridge)
	end
end
