class AddMoreDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
  end
end
