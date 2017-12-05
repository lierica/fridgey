Rails.application.routes.draw do
	resources :fridges
	resources :recipes
	resources :ingredients
	resources :frozen_servings
	resources :fridge_ingredients
	resources :recipe_ingredients
end
