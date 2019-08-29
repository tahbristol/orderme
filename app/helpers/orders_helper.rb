module OrdersHelper
  # module PriceFormatter
    def readable_price(price_in_cents)
      Money.new(price_in_cents, "USD").format
    end
  # end
  
  def order_button(label, user, order)
    
   case label
   when "Edit Order"
     if order.requestor == user && order.requested?
       link_to("Edit Order", edit_order_path(order), class: "btn btn-primary")
     end
   when "Add Note"
     if (order.requested? && user == order.requestor) || (order.pending? && user == order.purchaser)
       link_to("Add Note", new_order_note_path(order), class: "btn btn-primary")
     end
     
   when "Begin Ordering"
     if order.processing_step <= 2
       if !order.requested? && user == order.purchaser
         link_to("Begin Ordering", order_begin_path(order), class: "btn btn-primary")
       elsif order.requested? && user.purchaser?
         link_to("Purchase", order_purchase_path(order), method: :post, class: "btn btn-primary")
       end
     end
     
   when "Invoice"
     if order.placed? && order.requestor == user
       link_to("Invoice", order_begin_path(order), class: "btn btn-primary")
     end
   end
  end
  
  def all_orders(orders)
    if orders.empty?
      table_title = "There are no orders"
      render(partial: "orders/no_orders", locals: { table_title: table_title })
    else
      table_title = "All Orders"
      render(partial: "orders/table", locals: { orders: orders, actions: true, table_title: table_title })
    end
  end
  
  def checkboxes(order, item)
    render(partial: "orders/checkboxes", locals: { order: order, item: item })
  end
end
