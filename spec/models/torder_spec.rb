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

require 'rails_helper'

RSpec.describe Torder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
