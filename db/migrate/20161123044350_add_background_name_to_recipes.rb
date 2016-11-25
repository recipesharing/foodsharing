class AddBackgroundNameToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :background_name, :string
  end
end
