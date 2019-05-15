require 'rails_helper'

feature "User can view items in an order" do
  before(:each) do
    sign_up('test name', 'test@email.com')
  end
  
  scenario "as owner or non owner" do
    create_order
    
    order = Order.first
    find(".orderListItem_#{order.id}").click
    
    expect(page).to have_content 'Order Details'
  end
end