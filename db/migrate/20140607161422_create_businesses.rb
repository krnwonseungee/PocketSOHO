class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :slogan
      t.string :image_url

      t.timestamps
    end
  end
end
