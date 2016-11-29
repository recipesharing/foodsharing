# == Schema Information
#
# Table name: main_ingredients
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MainIngredient < ApplicationRecord
  has_many :recipes, dependent: :destroy
end
