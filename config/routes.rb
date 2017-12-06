Rails.application.routes.draw do
	resources :fridges do
		resources :frozen_servings
		resources :fridge_ingredients
	end

	resources :recipes
	resources :ingredients
	resources :fridge_ingredients
	resources :recipe_ingredients
end
