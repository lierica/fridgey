Rails.application.routes.draw do
	resources :fridges do
		resources :frozen_servings
		resources :fridge_ingredients
	end

	resources :recipes
	resources :ingredients
	resources :recipe_ingredients

	post '/fridges/:id/throwaway', to: "fridges#throwaway", as: "throwaway"
end
