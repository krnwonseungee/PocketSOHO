class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.belongs_to :business
      t.belongs_to :user
      t.timestamps
    end
  end
end
