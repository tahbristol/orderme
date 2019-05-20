require 'rails_helper'

feature "Users can view all orders" do
  scenario "created by anyone" do
    sign_up('test name', 'test@email.com')
    create_order(4)
    
    click_on "View All Orders"
    orders = page.all('.orderList .singleOrder')
    
    expect(page).to have_content "Placed Orders"
    expect(orders.count).to eq 4
    
  end
end