class OrderRecipe < ApplicationRecord
  belongs_to :order
  belongs_to :recipe
end
