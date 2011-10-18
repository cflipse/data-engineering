class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.integer :price_in_cents
      t.belongs_to :merchant

      t.timestamps
    end

    add_index :items, :merchant_id
  end
end
