class AddNameToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :name, :string
  end
end
