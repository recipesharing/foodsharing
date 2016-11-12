class RemoveStepOnInstructions < ActiveRecord::Migration[5.0]
  def up
    remove_column :instructions, :step
  end

  def down
    add_column :instructions, :step, :json
  end
end
