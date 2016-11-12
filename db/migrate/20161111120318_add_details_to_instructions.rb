class AddDetailsToInstructions < ActiveRecord::Migration[5.0]
  def change
    add_column :instructions, :step, :integer
    add_column :instructions, :title, :string
    add_column :instructions, :content, :text
  end
end
