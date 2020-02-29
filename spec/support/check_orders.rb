module Features
  def check_items(num, all=true)
    orders = page.all('.singleOrder')
    if orders.empty?
      raise 'No line items found'
    end
    
    if all
      orders.each do |order|
        order.click
      end
    else
      (0..num).each do |num|
        orders[num].click
      end
    end
  end
end