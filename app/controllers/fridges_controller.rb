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
	end

	def throwaway
		@fridge = Fridge.find(params[:id])
		@fridge.toss
		redirect_to fridge_path(@fridge)
	end

	def eat_meals
		@fridge = Fridge.find(params[:id])
		@fridge.eat_meals(params[:eat_meals])
		redirect_to fridge_path(@fridge)
	end

	def eat_ingredients
		@fridge = Fridge.find(params[:id])
		@fridge.eat_ingredients(params[:eat_ingredients])
		redirect_to fridge_path(@fridge)
	end

	def analytics
		@fridge = Fridge.find(params[:fridge_id])
		@meals_expiring_most_often = @fridge.meals_expiring_most_often
		@ingredients_expiring_most_often = @fridge.ingredients_expiring_most_often
		@most_frequent_meals = @fridge.most_frequent_meals
		@most_frequent_ingredients = @fridge.most_frequent_ingredients
	end

end
