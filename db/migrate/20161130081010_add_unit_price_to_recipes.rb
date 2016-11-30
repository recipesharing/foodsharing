class AddUnitPriceToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :unit_price, :integer
  end
end
