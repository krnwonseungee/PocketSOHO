class RemoveBusinessIdFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :business_id, :integer
  end
end
