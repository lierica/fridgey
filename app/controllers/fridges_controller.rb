class FridgesController < ApplicationController

before_action :authorized, except: [:new, :create]

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
		if params[:eat_meals].nil?
			redirect_to fridge_path(@fridge)
		else
			@fridge.eat_meals(params[:eat_meals])
			redirect_to fridge_path(@fridge)
		end
	end

	def eat_ingredients
		@fridge = Fridge.find(params[:id])
		if params[:eat_ingredients].nil?
			redirect_to fridge_path(@fridge)
		else
			@fridge.eat_ingredients(params[:eat_ingredients])
			redirect_to fridge_path(@fridge)
		end
	end

	def analytics
		@fridge = Fridge.find(params[:fridge_id])
		@meals_expiring_most_often = @fridge.meals_expiring_most_often
		@ingredients_expiring_most_often = @fridge.ingredients_expiring_most_often
		@most_frequent_meals = @fridge.most_frequent_meals
		@most_frequent_ingredients = @fridge.most_frequent_ingredients
	end

	private

	def authorized
		if !logged_in?
			redirect_to '/fridges/new'
		end

	end
end
