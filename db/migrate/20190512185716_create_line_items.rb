class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :order_id
      t.string :name
      t.integer :quantity
      t.string :price
      t.string :catalogue_number
      t.string :vendor
      t.timestamps
    end
  end
end
