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
  end
end
