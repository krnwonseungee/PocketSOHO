class CreateBusinessesAndUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :slogan
      t.string :image_url

      t.timestamps
    end

    create_table :business_owners do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :emali
      t.string :image_url
      t.belongs_to :business

      t.timestamps
    end

    create_table :businesses_users, id: false do |t|
      t.belongs_to :business
      t.belongs_to :business_owner
    end
  end
end
