# == Schema Information
#
# Table name: torder_statuses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TorderStatus < ApplicationRecord
  has_many :torders
end
