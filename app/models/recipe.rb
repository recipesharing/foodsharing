# == Schema Information
#
# Table name: recipes
#
#  id                 :integer          not null, primary key
#  video_id           :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  public_id          :string
#  country_id         :integer
#  short_description  :string
#  cooking_time_min   :integer          default(0)
#  calory             :integer          default(0)
#  thumbnail          :string           is an Array
#  name               :string
#  serving_num        :integer          default(2)
#  ingredient_url     :string
#  background_image   :string
#  user_id            :integer
#  season_id          :integer
#  main_ingredient_id :integer
#  background_name    :string
#

class Recipe < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :short_description
  validates_presence_of :video_id
  validates_presence_of :description
  belongs_to :country
  belongs_to :user
  belongs_to :season
  belongs_to :main_ingredient
  has_many :ingredients
  has_many :instructions

  acts_as_commentable
  acts_as_votable

  def up_votes
    get_upvotes.size
  end

  def self.filter(params)
    # use scope to filter result
    cuisine = params[:cuisine].split(',') if params[:cuisine]
    ingredient = params[:main_ingredient].split(',') if params[:main_ingredient]
    season = params[:season].split(',') if params[:season]
    # chained filter out result
    result = Recipe.all
    # cuisine filter
    result = cuisine(cuisine) if cuisine

    # ingredient filter
    result2 = if ingredient
                result.ingredient(ingredient)
              else
                result
              end

    # season filter
    if season
      result2.season(season)
    else
      result2
    end
  end

  def self.search(params)
    key = "%#{params[:search]}%"
    where('name ILIKE ? OR description ILIKE ?', key, key)
  end

  scope :cuisine, ->(cuisine) { where('country_id IN (?)', cuisine) }
  scope :ingredient, ->(a) { where('main_ingredient_id IN (?)', a) }
  scope :season, ->(season) { where('season_id IN (?)', season) }
  scope :order_name, ->(dir) { order(name: dir) }
  scope :order_cook_time, ->(dir) { order(cooking_time_min: dir) }
end
