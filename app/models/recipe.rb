# == Schema Information
#
# Table name: recipes
#
#  id                :integer          not null, primary key
#  video_id          :string
#  description       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  public_id         :string
#  country_id        :integer
#  short_description :string
#  cooking_time_min  :integer          default(0)
#  calory            :integer          default(0)
#

class Recipe < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :short_description
  validates_presence_of :video_id
  validates_presence_of :description
  belongs_to :country
  belongs_to :user
  has_many :ingredients
  has_many :instructions

  acts_as_commentable
end
