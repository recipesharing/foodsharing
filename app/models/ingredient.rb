class Ingredient < ApplicationRecord
  validates_present_of :name
  validates_present_of :url
  validates_present_of :description
end
