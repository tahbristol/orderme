class AddPurchaserIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :purchaser_id, :integer
  end
end
