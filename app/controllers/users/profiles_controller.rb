# user profile page controller
class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    recipe_ids = current_user.find_liked_items.map(&:id)
    @short_lists = Recipe.where(id: recipe_ids)
    @torder_item = current_torder.torder_items.new
    @user = current_user
  end

  
end
