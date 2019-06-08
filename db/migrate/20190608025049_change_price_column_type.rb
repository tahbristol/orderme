class ChangePriceColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :line_items, :price, :integer, using: 'price::integer'
  end
end
