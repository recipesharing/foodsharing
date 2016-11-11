class Instruction < ApplicationRecord
  validates_presence_of :step
  belongs_to :recipe
end
