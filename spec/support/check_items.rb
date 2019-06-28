module Features
  def check_items(num, all=true)
    line_items = page.all('.lineItems')
    if all
      line_items.each do |item|
        byebug
        item.click
      end
    else
      (0..num).each do |num|
        line_items[num].click
      end
    end
  end
end
