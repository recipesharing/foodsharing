class AddRecipeToInstruction < ActiveRecord::Migration[5.0]
  def change
    add_reference :instructions, :recipe, foreign_key: true
  end
end
