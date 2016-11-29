# user profile page controller
class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    recipe_ids = current_user.find_liked_items.map(&:id)
    @short_lists = Recipe.where(id: recipe_ids)
  end
end
