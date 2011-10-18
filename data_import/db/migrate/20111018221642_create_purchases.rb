class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :count
      t.belongs_to :item
      t.belongs_to :customer

      t.timestamps
    end
    add_index :purchases, :item_id
    add_index :purchases, :customer_id
  end
end
