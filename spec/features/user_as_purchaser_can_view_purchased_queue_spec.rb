require 'rails_helper'

feature "User as purchaser can view purchased queue" do
  scenario "of their own purchase orders" do
    sign_up_as_purchaser('test name', 'test@email.com')
    create_order(1)
    
    visit user_path(User.first)
    click_on "View All Orders"
    
    find("#orderListItem_#{Order.first.id}").click
    click_on "Purchase"
    click_on "Purchased Queue"
    
    order = Order.first
    expect(page).to have_content(order.created_at)
    expect(page).to have_content("pending")
  end
end