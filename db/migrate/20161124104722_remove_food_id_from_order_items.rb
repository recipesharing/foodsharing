class RemoveFoodIdFromOrderItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :order_recipes, :food_id
  end
end
