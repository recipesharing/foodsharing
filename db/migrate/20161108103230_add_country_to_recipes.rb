class AddCountryToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :country, foreign_key: true
  end
end
