class AddOpenedByReceiverToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :opened_by_receiver, :boolean, :default => false
  end
end
