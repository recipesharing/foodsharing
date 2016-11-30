# cook book controller
class CookBooksController < ApplicationController
  before_action :repare_recipes, only: [:index]
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

  private

  def repare_recipes
    @recipes = if params[:search]
                 Recipe.filter(params).search(params)
               else
                 Recipe.all
               end
    if params['sort']
      params['sort'].split(',').each do |sort|
        sort = sort.split('/')
        @recipes = @recipes.order_name(sort[1]) if sort[0] == 'name'
        @recipes = @recipes.order_cook_time(sort[1]) if sort[0] == 'cooking time'
      end
    end
  end
end
