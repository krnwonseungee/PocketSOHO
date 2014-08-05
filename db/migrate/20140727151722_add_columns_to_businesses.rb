class AddColumnsToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :city, :string
    add_column :businesses, :state, :string
    add_column :businesses, :description, :text
  end
end
