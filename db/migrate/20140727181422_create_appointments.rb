class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.text :text
      t.belongs_to :customer
      t.belongs_to :business_owner
      t.belongs_to :business
      t.text :notes
      t.date :date
      t.time :time
      t.timestamps
    end
  end
end
