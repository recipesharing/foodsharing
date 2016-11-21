class Order < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :order_recipes
  has_many :order_recipes
end
