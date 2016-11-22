class AddSeasonToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :season, foreign_key: true
  end
end
