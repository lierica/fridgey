class Fridge < ApplicationRecord
	has_many :fridge_ingredients
	has_many :ingredients, through: :fridge_ingredients
	has_many :frozen_servings
	has_many :recipes, through: :frozen_servings

	def sort(sort_method)
		if sort_method.nil?
			self.fridge_ingredients.order(:date_in)
		elsif sort_method == "DATE DESC"
			self.fridge_ingredients.order(date_in: :desc)
		elsif sort_method == "NAME"
			self.fridge_ingredients.joins(:ingredient).order("name")
		elsif sort_method == "EXP ASC"
		end
	end

	def ordered_hash
		self.fridge_ingredients.inject({}) do |acc, ingredient|
			acc[ingredient.id] = ingredient.days_until_expiration
			acc
		end
	end


# create a list of each fridge ingredient (id) and corresponding expiration date (helper)
# {id => days}
# order hash
# all fridge ingredients to array in order specified in hash.
end

#
# ([["Expiring Soonest", "EXP ASC"], ["Most Days Until Expiration", "EXP DESC"],
