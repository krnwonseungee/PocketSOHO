class AddZipcodeToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :zipcode, :string
  end
end
