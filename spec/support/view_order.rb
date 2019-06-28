module Features
  def view_order(order_number)
    find("#viewOrder_#{order_number}").click
  end
end
