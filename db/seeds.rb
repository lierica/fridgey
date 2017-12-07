# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.create(name: "Macaroni and Cheese")
Recipe.create(name: "Turkey Tacos")
Recipe.create(name: "Pepperoni Pizza")
Recipe.create(name: "Pulled Pork Sandwich")
Recipe.create(name: "Roast Chicken")

Ingredient.create(name: "Elbow Pasta", expiration_days: 10)
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

Fridge.create(name: "Josh's Fridge")
Fridge.create(name: "Erica's Fridge")

FrozenServing.create(recipe_id: 4, fridge_id: 1, date_in: "2017-11-30")
FrozenServing.create(recipe_id: 2, fridge_id: 1, date_in: "2017-12-01")
FrozenServing.create(recipe_id: 1, fridge_id: 2, date_in: "2017-12-05")
FrozenServing.create(recipe_id: 3, fridge_id: 2, date_in: "2017-10-03")
FrozenServing.create(recipe_id: 3, fridge_id: 2, date_in: "2017-09-03")
FrozenServing.create(recipe_id: 3, fridge_id: 2, date_in: "2017-08-03")
FrozenServing.create(recipe_id: 3, fridge_id: 2, date_in: "2017-07-03")
FrozenServing.create(recipe_id: 5, fridge_id: 2, date_in: "2017-06-03")
FrozenServing.create(recipe_id: 5, fridge_id: 2, date_in: "2017-05-03")
FrozenServing.create(recipe_id: 5, fridge_id: 2, date_in: "2017-04-03")
FrozenServing.create(recipe_id: 5, fridge_id: 2, date_in: "2017-03-03")
FrozenServing.create(recipe_id: 1, fridge_id: 2, date_in: "2017-04-09")

FridgeIngredient.create(fridge_id: 1, ingredient_id: 1, date_in: "2017-12-05")
FridgeIngredient.create(fridge_id: 1, ingredient_id: 2, date_in: "2017-11-30")
FridgeIngredient.create(fridge_id: 2, ingredient_id: 3, date_in: "2017-12-04")
FridgeIngredient.create(fridge_id: 2, ingredient_id: 4, date_in: "2017-11-28")
FridgeIngredient.create(fridge_id: 2, ingredient_id: 5, date_in: "2017-12-03")
