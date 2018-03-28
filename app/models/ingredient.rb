class Ingredient < ApplicationRecord
	has_many :fridge_ingredients
	has_many :recipe_ingredients
	has_many :fridges, through: :fridge_ingredients
	has_many :recipes, through: :recipe_ingredients
	validates :expiration_days, presence: true
end
