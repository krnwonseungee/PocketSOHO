class CreateBusinessesAndUsers < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :slogan
      t.string :image_url
      t.belongs_to :business_owner
      t.timestamps
    end

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :email
      t.string :image_url
      t.string :type
      t.timestamps
    end

    # create_table :businesses_users, id: false do |t|
    #   t.belongs_to :business
    #   t.belongs_to :user
    # end
  end
end
