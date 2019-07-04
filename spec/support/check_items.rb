module Features
  def check_items(num, all=true)
    line_items = page.all('.lineItems td:last-child')
    if all
      line_items.each do |item|
        item.click
      end
    else
      (0..num).each do |num|
        line_items[num].click
      end
    end
  end
end
