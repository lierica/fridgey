require 'spec_helper'
require 'rails_helper'

describe FrozenServing do

    it 'has a name' do
      expect(@meal1.recipe.name).to eq("Macaroni and Cheese")
    end

		it 'has a fridge' do
      expect(@meal1.fridge_id).to eq(1)
    end

		it 'has a date in' do
      expect(@meal1.date_in).to eq(("2017-11-30").to_date)
    end

    it 'initialized without a date out' do
      expect(@meal1.date_out).to eq(nil)

	end
end
