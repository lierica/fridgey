class CreateFridgeIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :fridge_ingredients do |t|
      t.belongs_to :ingredient, foreign_key: true
      t.belongs_to :fridge, foreign_key: true
      t.date :date_in
      t.date :date_out

      t.timestamps
    end
  end
end
