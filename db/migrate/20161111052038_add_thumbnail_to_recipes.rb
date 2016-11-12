class AddThumbnailToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :thumbnail, :string, array: true
  end
end
