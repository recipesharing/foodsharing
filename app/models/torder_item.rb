# == Schema Information
#
# Table name: torder_items
#
#  id          :integer          not null, primary key
#  recipe_id   :integer
#  torder_id   :integer
#  unit_price  :integer
#  quantity    :integer
#  total_price :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TorderItem < ApplicationRecord
  belongs_to :recipe
  belongs_to :torder
end
