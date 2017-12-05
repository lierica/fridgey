class Recipe < ApplicationRecord
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients
	has_many :frozen_servings
	has_many :fridges, through: :frozen_servings
end
