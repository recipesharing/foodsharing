class AddPublicIdToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :public_id, :string
  end
end
