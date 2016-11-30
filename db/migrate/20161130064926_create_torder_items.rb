class CreateTorderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :torder_items do |t|
      t.references :recipe, foreign_key: true
      t.references :torder, foreign_key: true
      t.integer :unit_price
      t.integer :quantity
      t.integer :total_price

      t.timestamps
    end
  end
end
