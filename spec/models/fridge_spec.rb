require 'spec_helper'
require 'rails_helper'

describe Fridge do

    it 'has a name' do
      expect(@josh.name).to eq("Josh's Fridge")
    end

		it 'has a password' do
      expect(@josh.password_digest).to eq("beef")
    end

		it 'has many meals' do
      expect(@josh.frozen_servings).to include(@meal1, @meal2)
    end

    it 'has many fridge ingredients' do
      expect(@josh.fridge_ingredients).to include(@ingredient1, @ingredient2)

	end
end
