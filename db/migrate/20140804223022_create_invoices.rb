class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.belongs_to :customer
      t.belongs_to :business
      t.decimal :amount
      t.date :due_date
      t.boolean :paid, default: false
      t.boolean :paid_on_time
      t.timestamps
    end
  end
end
