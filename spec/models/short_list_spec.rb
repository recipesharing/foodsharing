# == Schema Information
#
# Table name: short_lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  recipe_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ShortList, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
