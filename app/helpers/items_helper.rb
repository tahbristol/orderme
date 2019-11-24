module ItemsHelper
  def update_for_each_item(items, order_id)
    items.each do |item|
      item_hash = JSON.parse(item)
      line_item = Order.find(order_id).line_items.where(id: item_hash["id"])
      line_item.update(item_hash["attribute"].to_sym => item_hash["value"])
    end
  end

end
