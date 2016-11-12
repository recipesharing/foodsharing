class AddBackgroundImageToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :background_image, :string
  end
end
