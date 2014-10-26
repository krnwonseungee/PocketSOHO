class CreateUsersBusinessesTable < ActiveRecord::Migration
  def change
    create_table :users_businesses, id: false do |t|
      t.belongs_to :user
      t.belongs_to :business
    end
  end
end
