class AddRecipeIdToOrderRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :order_recipes, :recipe_id, :integer
  end
end
