class CreateFrozenServings < ActiveRecord::Migration[5.1]
  def change
    create_table :frozen_servings do |t|
      t.belongs_to :recipe, foreign_key: true
      t.belongs_to :fridge, foreign_key: true
      t.date :date_in
      t.date :date_out

      t.timestamps
    end
  end
end
