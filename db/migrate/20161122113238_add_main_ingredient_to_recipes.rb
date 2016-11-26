class AddMainIngredientToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :main_ingredient, foreign_key: true
  end
end
