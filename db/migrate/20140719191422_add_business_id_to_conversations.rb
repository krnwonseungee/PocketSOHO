class AddBusinessIdToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :business_id, :integer
  end
end
