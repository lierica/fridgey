class AddExpiredColumntoFridgeIngredients < ActiveRecord::Migration[5.1]
  def change
    add_column :fridge_ingredients, :expired, :boolean, default: false
  end
end
