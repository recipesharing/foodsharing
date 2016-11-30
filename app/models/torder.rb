# == Schema Information
#
# Table name: torders
#
#  id               :integer          not null, primary key
#  total            :integer
#  subtotal         :integer
#  torder_status_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

# torder model
class Torder < ApplicationRecord
  belongs_to :torder_status
  has_many :torder_items
  before_create :set_torder_status
  before_save :update_subtotal

  def subtotal
    torder_items.collect\
    { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  private

  def set_torder_status
    self.torder_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
