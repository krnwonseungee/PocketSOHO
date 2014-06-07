class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :location
      t.string :description
      t.date :slogan
      t.boolean :image_url

      t.timestamps
    end
  end
end
