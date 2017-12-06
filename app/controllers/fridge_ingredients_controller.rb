class FridgeIngredientsController < ApplicationController

	def new
		@fridge_ingredient = FridgeIngredient.new
		@ingredients = Ingredient.all
		@fridge = Fridge.find(params[:fridge_id])
	end

	def create
		@fridge = Fridge.find(params[:fridge_id])
		if params[:name].empty?
			@fridge_ingredient = FridgeIngredient.create(ingredient_id: params[:fridge_ingredient][:ingredient_id], fridge_id: params[:fridge_id], date_in: params[:fridge_ingredient][:date_in])
		else
			@ingredient = Ingredient.create(name: params[:name], expiration_days: params[:expiration_days])
			@fridge_ingredient = FridgeIngredient.create(ingredient_id: @ingredient.id, fridge_id: params[:fridge_id], date_in: params[:fridge_ingredient][:date_in])
		end
			redirect_to fridge_path(@fridge)
	end
end
