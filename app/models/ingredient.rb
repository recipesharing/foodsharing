# == Schema Information
#
# Table name: ingredients
#
#  id          :integer          not null, primary key
#  name        :string
#  url         :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  recipe_id   :integer
#

class Ingredient < ApplicationRecord
  validates_presence_of :name
  belongs_to :recipe
end
