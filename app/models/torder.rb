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
  belongs_to :user
  # before_create :set_torder_status
  before_validation :set_torder_status
  before_save :update_subtotal
  accepts_nested_attributes_for :torder_items
  accepts_nested_attributes_for :torder_status


  def subtotal
    # torder_items.collect\
    # { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
    0
  end

  def overall_price
    
  end 

  
  private

  def set_torder_status
    # debugger
    # self.torder_status_id = 1
    # self.torder_status_id = 1 if self.torder_status_id.nil?
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
