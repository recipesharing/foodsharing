class AddDetailsToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :short_description, :string
    add_column :recipes, :cooking_time_min, :integer, default: 0
    add_column :recipes, :calory, :integer, default: 0
  end
end
