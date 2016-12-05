class AddReciverInfoToTorders < ActiveRecord::Migration[5.0]
  def change
    add_column :torders, :firstname, :string
    add_column :torders, :lastname, :string
    add_column :torders, :phone, :integer
    add_column :torders, :address, :string 
  end
end
