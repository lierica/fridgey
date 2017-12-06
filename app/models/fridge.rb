class Fridge < ApplicationRecord
	has_many :fridge_ingredients
	has_many :ingredients, through: :fridge_ingredients
	has_many :frozen_servings
	has_many :recipes, through: :frozen_servings

	def expired_fridge_ingredients

	end

	def good_fridge_ingredients
	end

	def expired_frozen_servings
	end

	def good_frozen_servings

	end

	def sort_fridge_ingredients(sort_method)
		if sort_method.nil? || sort_method == "DATE ASC"
			self.fridge_ingredients.order(:date_in)
		elsif sort_method == "DATE DESC"
			self.fridge_ingredients.order(date_in: :desc)
		elsif sort_method == "NAME"
			self.fridge_ingredients.joins(:ingredient).order("name")
		elsif sort_method == "EXP ASC"
			self.ordered_fridge_ingredients
		elsif sort_method == "EXP DESC"
			self.ordered_fridge_ingredients.reverse
		end
	end

	def ordered_hash_fridge_ingredients
		unordered = self.fridge_ingredients.inject({}) do |acc, ingredient|
			acc[ingredient.id] = ingredient.days_until_expiration
			acc
		end
		unordered.sort_by { |k, v| v}
	end

	def ordered_fridge_ingredients
		self.ordered_hash_fridge_ingredients.map do |pair|
			self.fridge_ingredients.find(pair[0])
		end
	end

	def sort_frozen_servings(sort_method)
		if sort_method.nil? || sort_method == "DATE ASC"
			self.frozen_servings.order(:date_in)
		elsif sort_method == "DATE DESC"
			self.frozen_servings.order(date_in: :desc)
		elsif sort_method == "NAME"
			self.frozen_servings.joins(:recipe).order("name")
		elsif sort_method == "EXP ASC"
			self.ordered_frozen_servings
		elsif sort_method == "EXP DESC"
			self.ordered_frozen_servings.reverse
		end
	end

	def ordered_hash_frozen_servings
		unordered = self.frozen_servings.inject({}) do |acc, meal|
			acc[meal.id] = meal.days_until_expiration
			acc
		end
		unordered.sort_by { |k, v| v}
	end

	def ordered_frozen_servings
		self.ordered_hash_frozen_servings.map do |pair|
			self.frozen_servings.find(pair[0])
		end
	end

end
