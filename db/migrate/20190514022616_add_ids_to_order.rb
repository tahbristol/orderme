class AddIdsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :requestor_id, :integer
  end
end
