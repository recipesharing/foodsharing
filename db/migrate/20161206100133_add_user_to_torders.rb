class AddUserToTorders < ActiveRecord::Migration[5.0]
  def change
    add_reference :torders, :user, foreign_key: true
  end
end
