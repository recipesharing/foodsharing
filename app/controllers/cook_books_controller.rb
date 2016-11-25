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
<<<<<<< HEAD
    @recipes = if params[:search]
                 Recipe.filter(params).search(params)
               else
                 Recipe.all
               end
=======
    if params[:search]
      @recipes = if params[:search] == ''
                   Recipe.all
                 else
                   Recipe.search(params)
                 end
      @recipes = @recipes.cuisine(params) if params[:cuisine]
    else
      @recipes = Recipe.all
    end
>>>>>>> o_develop
  end
end
