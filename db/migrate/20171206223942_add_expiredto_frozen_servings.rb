class AddExpiredtoFrozenServings < ActiveRecord::Migration[5.1]
  def change
    add_column :frozen_servings, :expired, :boolean, default: false
  end
end
