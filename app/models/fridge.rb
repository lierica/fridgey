class Fridge < ApplicationRecord
	has_many :fridge_ingredients
	has_many :ingredients, through: :fridge_ingredients
	has_many :frozen_servings
	has_many :recipes, through: :frozen_servings
end
