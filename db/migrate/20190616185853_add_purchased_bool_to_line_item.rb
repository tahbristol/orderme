class AddPurchasedBoolToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :purchased, :boolean, default: false
  end
end
