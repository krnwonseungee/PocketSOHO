class RemoveColumnsFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :image_url
    remove_column :businesses, :slogan
  end
end
