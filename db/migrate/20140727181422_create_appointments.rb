class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :customer
      t.belongs_to :business_owner
      t.belongs_to :business
      t.belongs_to :invoice
      t.text :notes
      t.date :date
      t.datetime :time
      t.timestamps
    end
  end
end
