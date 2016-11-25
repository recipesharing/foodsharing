class OrderRecipe < ApplicationRecord
  belongs_to :order
  has_many :recipe
end
