Rails.application.routes.draw do
	resources :fridges do
		resources :frozen_servings, only: [:new, :create]
		resources :fridge_ingredients, only: [:new, :create]
		get '/analytics', to: "fridges#analytics", as: "analytics"
	end

	post '/fridges/:id/throwaway', to: "fridges#throwaway", as: "throwaway"
	post '/fridges/:id/eat_meals', to: "fridges#eat_meals", as: "eat_meals"
	post '/fridges/:id/eat_ingredients', to: "fridges#eat_ingredients", as: "eat_ingredients"
	get '/', to: "sessions#new"
	post '/', to: "sessions#create"
	get '/signup', to: "fridges#new"
	post '/signup', to: "fridges#create"
	post '/logout', to: "sessions#destroy"

end
