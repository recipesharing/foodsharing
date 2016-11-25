class Season < ApplicationRecord
  has_many :recipes, dependent: :destroy
end
