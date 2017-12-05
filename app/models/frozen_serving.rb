class FrozenServing < ApplicationRecord
  belongs_to :recipe
  belongs_to :fridge
end
