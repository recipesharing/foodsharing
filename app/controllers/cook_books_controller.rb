class CookBooksController < ApplicationController
  before_action :repare_recipes, only: [:index]
  def index
    raise 'e'
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
  end
end
