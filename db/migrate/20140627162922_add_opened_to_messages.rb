class AddOpenedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :opened, :boolean
  end
end
