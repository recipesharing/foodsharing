class CookBooksController < ApplicationController
  before_action :repare_recipes, only: [:index]
  def index
    # if params[:cuisine]
    #   debugger
    # end
    @main_ingredients = MainIngredient.all
    @cuisines = Country.all
    @seasons = Season.all
  end

  private

  def repare_recipes
    if params[:search]
      @recipes = Recipe.search(params)
    else
      @recipes = if params[:page] then
        Recipe.page(params[:page]).includes(:season, :main_ingredient, :country)
      else
        Recipe.page(1).includes(:season, :main_ingredient, :country)
      end
    end

    if params[:cuisine]
      @recipes = @recipes.cuisine(params)
    end
  end
end
