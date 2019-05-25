require 'rails_helper'

feature "User as purchaser can acquire order" do
  before(:each) do
    sign_up_as_purchaser('test name', 'test@email.com')
    create_order(1)
    visit user_path(User.first)
    click_on "All Orders"
    find("#orderListItem_#{Order.first.id}").click
    
    click_on "Purchase"
  end
  
  scenario ",order gets purchaser attribute set" do
    order = Order.first
    expect(order.purchaser).to eq User.first
  end
  
  scenario ",order status gets updated to pending" do
    order = Order.first
    expect(order.pending?).to eq true
  end
  
  scenario ",order is no longer editable" do
    expect(page).not_to have_content "Edit Order"
  end
end