class CreateMessagesAndThreads < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.belongs_to :business_owner
      t.belongs_to :customer
      t.belongs_to :business
      t.belongs_to :thread
      t.timestamps
    end

    create_table :threads, id: false do |t|
      t.belongs_to :business_owner
      t.belongs_to :customer
    end
  end
end
