# cook book controller
class CookBooksController < ApplicationController
  before_action :repare_recipes, only: [:index]
  def index
    @main_ingredients = MainIngredient.all
    @cuisines = Country.all
    @seasons = Season.all
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
<<<<<<< HEAD
=======
    if params['sort']
      params['sort'].split(',').each do |sort|
        sort = sort.split('/')
        @recipes = @recipes.order_name(sort[1]) if sort[0] == 'name'
        @recipes = @recipes.order_cook_time(sort[1]) if sort[0] == 'cooking time'
      end
    end
>>>>>>> 8a085f8eb018791981eabf77bf854d8370b4c7fb
  end
end
