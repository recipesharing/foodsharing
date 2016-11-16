class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.decimal :amount
      t.string :currency
      t.date :date
      t.user :reference

      t.timestamps
    end
  end
end
