class CreateTorders < ActiveRecord::Migration[5.0]
  def change
    create_table :torders do |t|
      t.integer :total
      t.integer :subtotal
      t.references :torder_status, foreign_key: true

      t.timestamps
    end
  end
end
