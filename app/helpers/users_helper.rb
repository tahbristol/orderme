module UsersHelper
  def user_orders(user, action)
    if user.orders.empty?
      "No Orders"
    elsif action == "purchased_queue"
      render(partial: "orders/table", locals: { orders: user.orders, actions: true, table_title: "Your Purchased Queue" })
    else
      render(partial: "orders/table", locals: { orders: user.orders, actions: true, table_title: "Your Orders" })
    end
  end
end
