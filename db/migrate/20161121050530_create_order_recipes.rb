class CreateOrderRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :order_recipes do |t|
      t.integer :quantity
      t.integer :food_id
      t.integer :order_id

      t.timestamps
    end
  end
end
