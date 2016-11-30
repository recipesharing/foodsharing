# == Schema Information
#
# Table name: order_items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class OrderItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :torder

  validates :quantity, presence: true, greater_than: 0
  validates_presence_of :recipe

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      100_000
      # recipe.tprice
    end
  end

  def total_price
    unit_price * quantity
  end

  private

  def recipe_present
    errors.add(:recipe, 'is not a valid or not active.') if recipe.nil?
  end

  def order_present
    errors.add(:torder, 'is not a valid order.') if torder.nil?
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
