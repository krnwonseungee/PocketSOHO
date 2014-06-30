class AddSeenByCustomerToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :seen_by_customer, :boolean, :default => false
  end
end
