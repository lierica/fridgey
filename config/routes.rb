Rails.application.routes.draw do
	resources :fridges do
		resources :frozen_servings
		resources :fridge_ingredients
	end

	resources :recipes
	resources :ingredients
	resources :recipe_ingredients

	post '/fridges/:id/throwaway', to: "fridges#throwaway", as: "throwaway"
	post '/fridges/:id/eat_meals', to: "fridges#eat_meals", as: "eat_meals"
	post '/fridges/:id/eat_ingredients', to: "fridges#eat_ingredients", as: "eat_ingredients"
end
