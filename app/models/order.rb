# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  status        :string           default("Pending")
#  total         :integer
#  vat           :integer
#  delivery_cost :integer
#  payment_id    :string
#  invoice       :string
#  pickup_time   :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class Order < ApplicationRecord
end
