class AddPaymentToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :payment, foreign_key: true
  end
end
