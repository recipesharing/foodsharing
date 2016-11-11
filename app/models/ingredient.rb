class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :url
  validates_presence_of :description
  belongs_to :recipe
end
