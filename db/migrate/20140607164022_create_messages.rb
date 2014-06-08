class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.belongs_to :business_owner
      t.references :messageable, polymorphic: true

      t.timestamps
    end
  end
end
