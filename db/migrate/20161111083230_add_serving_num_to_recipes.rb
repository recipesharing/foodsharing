class AddServingNumToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :serving_num, :integer, default: 2
  end
end
