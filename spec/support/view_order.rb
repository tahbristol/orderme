module Features
  def view_order
    find("#viewOrder_#{Order.last.id}").click
  end
end
