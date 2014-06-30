class AddSeenByBusinessOwnerToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :seen_by_business_owner, :boolean, :default => false
  end
end
