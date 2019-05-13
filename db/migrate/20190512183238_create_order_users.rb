class CreateOrderUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :order_users do |t|
      t.integer :order_id
      t.integer :user_id
      t.timestamps
    end
  end
end
