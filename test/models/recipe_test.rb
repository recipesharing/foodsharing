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

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
