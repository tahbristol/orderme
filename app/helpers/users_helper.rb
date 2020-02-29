module UsersHelper
  def user_orders(orders, action)
    if orders.empty?
      "No Orders"
    elsif action == "purchased_queue"
      render(partial: "orders/table", locals: { orders: orders, actions: true, table_title: "Your Purchased Queue" })
    elsif action == "batch_orders"
      render(partial: "orders/table", locals: {orders: orders, actions: true, table_title: "Choose Orders", batch: true })
    else
      render(partial: "orders/table", locals: { orders: orders, actions: true, table_title: "Your Orders" })
    end
  end
end
