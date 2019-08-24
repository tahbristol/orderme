module UsersHelper
  def user_orders(user)
    if user.orders.empty?
      "No Orders"
    else
      render(partial: "orders/table", locals: { orders: user.orders, actions: true })
    end
  end
end
