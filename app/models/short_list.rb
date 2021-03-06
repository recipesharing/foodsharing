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

class ShortList < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
end
