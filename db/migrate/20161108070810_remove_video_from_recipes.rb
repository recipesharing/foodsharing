class RemoveVideoFromRecipes < ActiveRecord::Migration[5.0]
  def change
    rename_column :recipes, :video, :video_id
  end
end
