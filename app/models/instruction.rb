# == Schema Information
#
# Table name: instructions
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :integer
#  step       :integer
#  title      :string
#  content    :text
#  image_url  :string
#

class Instruction < ApplicationRecord
  validates_presence_of :step
  belongs_to :recipe
end
