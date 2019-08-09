class AddCompleteBooleToLineItem < ActiveRecord::Migration[5.2]
  def change
    add_column :line_items, :complete, :boolean, defaut: false
  end
end
