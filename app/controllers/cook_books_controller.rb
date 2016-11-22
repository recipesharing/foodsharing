class CookBooksController < ApplicationController
  before_action :repare_recipes, only: [:index]
  def index
  end

  private

  def repare_recipes
    @recipes = if params[:page] then
      Recipe.page(params[:page])
    else
      Recipe.page(1)
    end
  end
end
