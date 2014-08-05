class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.belongs_to :customer
      t.belongs_to :business
      t.decimal :amount
      t.boolean :paid, default: false
      t.timestamps
    end
end
