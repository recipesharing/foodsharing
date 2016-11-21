class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :status, default: "Pending"
      t.integer :total
      t.integer :vat
      t.integer :delivery_cost
      t.string :payment_id
      t.string :invoice
      t.integer :pickup_time, default: 0
      t.datetime :created_at , null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
