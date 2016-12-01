# cook book controller
class CookBooksController < ApplicationController
  before_action :prepare_recipes, only: [:index]
  def index
    @user = current_user if user_signed_in?
    @main_ingredients = MainIngredient.all
    @cuisines = Country.all
    @seasons = Season.all
    @torder_item = current_torder.torder_items.new
    respond_to do |format|
      format.html
      format.js {}
    end
  end
end
