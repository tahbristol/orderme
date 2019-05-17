module Features
  def create_order(number_of_orders_to_create=1)
    number_of_orders_to_create.times do
      click_on 'Create Order'
      
      fill_in 'order_line_items_attributes_0_name', with: 'test item'
      fill_in 'order_line_items_attributes_0_quantity', with: 5
      fill_in 'order_line_items_attributes_0_price', with: 200
      fill_in 'order_line_items_attributes_0_catalogue_number', with: 'ABC000'
      fill_in 'order_line_items_attributes_0_vendor', with: 'test vendor'
      click_on 'Submit Order'
    end
  end
end