require 'spec_helper'
require 'rails_helper'

describe FridgeIngredient do

    it 'has a name' do
      expect(@ingredient1.ingredient.name).to eq("Elbow Pasta")
    end

		it 'has a fridge' do
      expect(@ingredient1.fridge_id).to eq(1)
    end

		it 'has a date in' do
      expect(@ingredient1.date_in).to eq(("2017-12-05").to_date)
    end

    it 'initialized without a date out' do
      expect(@ingredient1.date_out).to eq(nil)

	end
end
