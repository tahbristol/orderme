require 'rails_helper'

feature "User can edit order" do
  scenario "when they own it and the order status is 'requested'" do
    sign_up('test name', 'test@email.com')
    
    create_order(1)
    click_on "All Orders"
    order = Order.last
    click_on "viewOrder_#{order.id}"
    
    expect(page).to have_content "Edit Order"
  end
  
  scenario "unless they own it and the order status is other than requested" do
    sign_up('test name', 'test@email.com')
    
    create_order(1)
    order = Order.first.update(status: :pending, purchaser: create(:user))
    click_on "All Orders"
    order = Order.last
    click_on "viewOrder_#{order.id}" 
    
    expect(page).not_to have_content "Edit Order"
  end
  
  scenario "unless they do not own it" do
    sign_up('test name', 'test@email.com')
    create_other_users_order()
    
    click_on "All Orders"
    order = Order.last
    click_on "viewOrder_#{order.id}"
    
    expect(page).not_to have_content "Edit Order"
  end
end