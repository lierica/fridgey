Rails.application.routes.draw do
	resources :fridges do
		resources :frozen_servings
	end

	resources :recipes
	resources :ingredients
	resources :fridge_ingredients
	resources :recipe_ingredients
end
