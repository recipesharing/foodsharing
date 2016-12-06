class ChangeUnitPriceRecipes < ActiveRecord::Migration[5.0]
  def up
    change_column :recipes, :unit_price, :integer, default: 100_000
  end
  def down
    change_column :recipes, :unit_price, :integer, default: nil
  end
end
