class Fridge < ApplicationRecord
	has_many :fridge_ingredients
	has_many :ingredients, through: :fridge_ingredients
	has_many :frozen_servings
	has_many :recipes, through: :frozen_servings

	def expired_fridge_ingredients
		self.fridge_ingredients.each do |ingredient|
			if ingredient.days_until_expiration < 0
				ingredient.expired = true
				ingredient.save
			end
		end
	end

	def expired_frozen_servings
		self.frozen_servings.each do |meal|
			if meal.days_until_expiration < 0
				meal.expired = true
				meal.save
			end
		end
	end

	def toss
		self.fridge_ingredients.where(expired: true).each do |ingredient|
			ingredient.date_out = Date.today
			ingredient.save
		end
		self.frozen_servings.where(expired: true).each do |meal|
			meal.date_out = Date.today
			meal.save
		end
	end

	def eat_meals(meal_array)
		meal_array.each do |meal|
			eaten_meal = frozen_servings.find(meal)
			eaten_meal.date_out = Date.today
			eaten_meal.save
		end
	end

	def eat_ingredients(ingredient_array)
		ingredient_array.each do |ingredient|
			eaten_ingredient = fridge_ingredients.find(ingredient)
			eaten_ingredient.date_out = Date.today
			eaten_ingredient.save
		end
	end

	def sort_fridge_ingredients(sort_method)
		self.expired_fridge_ingredients
		if sort_method.nil? || sort_method == "DATE ASC"
			self.fridge_ingredients.where(expired: false).order(:date_in)
		elsif sort_method == "DATE DESC"
			self.fridge_ingredients.where(expired: false).order(date_in: :desc)
		elsif sort_method == "NAME"
			self.fridge_ingredients.where(expired: false).joins(:ingredient).order("name")
		elsif sort_method == "EXP ASC"
			self.ordered_fridge_ingredients
		elsif sort_method == "EXP DESC"
			self.ordered_fridge_ingredients.reverse
		end
	end

	def ordered_hash_fridge_ingredients
		unordered = self.fridge_ingredients.where(expired: false).inject({}) do |acc, ingredient|
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
		self.expired_frozen_servings
		if sort_method.nil? || sort_method == "DATE ASC"
			self.frozen_servings.where(expired: false).order(:date_in)
		elsif sort_method == "DATE DESC"
			self.frozen_servings.where(expired: false).order(date_in: :desc)
		elsif sort_method == "NAME"
			self.frozen_servings.where(expired: false).joins(:recipe).order("name")
		elsif sort_method == "EXP ASC"
			self.ordered_frozen_servings
		elsif sort_method == "EXP DESC"
			self.ordered_frozen_servings.reverse
		end
	end

	def ordered_hash_frozen_servings
		unordered = self.frozen_servings.where(expired: false).inject({}) do |acc, meal|
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

	def meals_expiring_most_often
		top_5 = self.frozen_servings.group("recipe_id").having(expired: true).order("count (*) DESC").first(5)
		top_5.inject({}) do |acc, meal|
			acc[meal.recipe.name] = self.frozen_servings.where("recipe_id = #{meal.recipe_id}").where(expired: true).count
			acc
		end

	end

	def ingredients_expiring_most_often
		top_5 = self.fridge_ingredients.group("ingredient_id").having(expired: true).order("count (*) DESC").first(5)
		top_5.inject({}) do |acc, ingredient|
			acc[ingredient.ingredient.name] = self.fridge_ingredients.where("ingredient_id = #{ingredient.ingredient_id}").where(expired: true).count
			acc
		end
	end

	def most_frequent_meals
		top_5 = self.frozen_servings.where(expired: false).where("date_out IS NOT NULL").group("recipe_id").order("count (*) DESC").first(5)
		top_5.inject({}) do |acc, meal|
			acc[meal.recipe.name] = self.frozen_servings.where("recipe_id = #{meal.recipe_id}").where(expired: false).where("date_out IS NOT NULL").count
			acc
		end
	end

	def most_frequent_ingredients
		top_5 = self.fridge_ingredients.where(expired: false).where("date_out IS NOT NULL").group("ingredient_id").order("count (*) DESC").first(5)
		top_5.inject({}) do |acc, ingredient|
			acc[ingredient.ingredient.name] = self.fridge_ingredients.where("ingredient_id = #{ingredient.ingredient_id}").where(expired: false).where("date_out IS NOT NULL").count
			acc
		end
	end

end
