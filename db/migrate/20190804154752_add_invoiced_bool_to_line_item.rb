class AddInvoicedBoolToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :invoiced, :boolean, default: false
  end
end
