# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Recipe.destroy_all
Ingredient.destroy_all
FrozenServing.destroy_all
FridgeIngredient.destroy_all
Fridge.create(name: "guest", password_digest: BCrypt::Password.create("test"))

Recipe.create(name: "Macaroni and Cheese")
Recipe.create(name: "Turkey Taco")
Recipe.create(name: "Pepperoni Pizza")
Recipe.create(name: "Pulled Pork Sandwich")
Recipe.create(name: "Red Lentil Cauliflower Coconut Milk Soup")
Recipe.create(name: "Bean Corn Chili")
Recipe.create(name: "Lamb Tagine")
Recipe.create(name: "Butternut Squash Apple Soup")
Recipe.create(name: "Sausage Herb Bean Stew")
Recipe.create(name: "Persian Veggie Stew")
Recipe.create(name: "Cabbage Curry Soup with Meat")
Recipe.create(name: "Breakfast Burrito")
Recipe.create(name: "Beef Enchilada")
Recipe.create(name: "Meatloaf")


Ingredient.create(name: "Basil Pesto", expiration_days: 7)
Ingredient.create(name: "Cashew Cheese", expiration_days: 7)
Ingredient.create(name: "Sweet Fennel Sausage", expiration_days: 5)
Ingredient.create(name: "Steak", expiration_days: 3)
Ingredient.create(name: "Applesauce", expiration_days: 7)
Ingredient.create(name: "Tomato", expiration_days: 5)
Ingredient.create(name: "Onion", expiration_days: 5)
Ingredient.create(name: "Garlic", expiration_days: 5)
Ingredient.create(name: "Spinach", expiration_days: 5)
Ingredient.create(name: "Carrot", expiration_days: 5)
Ingredient.create(name: "Broccoli", expiration_days: 5)
Ingredient.create(name: "Scallops", expiration_days: 2)
Ingredient.create(name: "Ground Beef", expiration_days: 3)
Ingredient.create(name: "American Cheese", expiration_days: 14)
Ingredient.create(name: "Ground Turkey", expiration_days: 4)
Ingredient.create(name: "Salsa", expiration_days: 7)
Ingredient.create(name: "Tortilla", expiration_days: 14)
Ingredient.create(name: "Pizza Dough", expiration_days: 5)
Ingredient.create(name: "Marinara Sauce", expiration_days: 10)
Ingredient.create(name: "Pepperoni", expiration_days: 14)
Ingredient.create(name: "Pork Shoulder", expiration_days: 5)
Ingredient.create(name: "Sandwich Buns", expiration_days: 7)
Ingredient.create(name: "Whole Chicken", expiration_days: 3)
FrozenServing.create(recipe_id: 4, fridge_id: 1, date_in: "2017-11-30")
FrozenServing.create(recipe_id: 2, fridge_id: 1, date_in: "2017-12-01")
FrozenServing.create(recipe_id: 1, fridge_id: 1, date_in: "2017-09-05")
FrozenServing.create(recipe_id: 4, fridge_id: 1, date_in: "2017-10-03")
FrozenServing.create(recipe_id: 5, fridge_id: 1, date_in: "2017-09-03")
FrozenServing.create(recipe_id: 3, fridge_id: 1, date_in: "2017-08-03")
FrozenServing.create(recipe_id: 6, fridge_id: 1, date_in: "2017-07-03")
FrozenServing.create(recipe_id: 8, fridge_id: 1, date_in: "2016-06-03")
FrozenServing.create(recipe_id: 8, fridge_id: 1, date_in: "2016-05-03")
FrozenServing.create(recipe_id: 8, fridge_id: 1, date_in: "2016-04-03")
FrozenServing.create(recipe_id: 8, fridge_id: 1, date_in: "2016-03-03")
FrozenServing.create(recipe_id: 1, fridge_id: 1, date_in: "2016-04-09")
FrozenServing.create(recipe_id: 3, fridge_id: 1, date_in: "2017-04-09")
FrozenServing.create(recipe_id: 7, fridge_id: 1, date_in: "2017-04-09")
FrozenServing.create(recipe_id: 10, fridge_id: 1, date_in: "2017-04-09")
FrozenServing.create(recipe_id: 11, fridge_id: 1, date_in: "2017-04-09")

FridgeIngredient.create(fridge_id: 1, ingredient_id: 1, date_in: "2017-12-05")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 2, date_in: "2017-11-30")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 3, date_in: "2017-12-04")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 4, date_in: "2017-11-28")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 5, date_in: "2016-12-03")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 5, date_in: "2016-12-03")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 5, date_in: "2016-12-03")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 5, date_in: "2016-12-03")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 6, date_in: "2016-12-05")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 6, date_in: "2016-12-06")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 7, date_in: "2017-12-01")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 8, date_in: "2017-12-02")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 9, date_in: "2017-11-30")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 10, date_in: "2017-12-01")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 11, date_in: "2017-12-02")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 12, date_in: "2017-12-03")
