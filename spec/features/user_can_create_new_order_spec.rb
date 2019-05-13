require 'rails_helper'

feature "User can create new order" do
  before(:each) do
    sign_up('test name', 'test@email.com')
  end
  
  scenario "successfully" do
    click_on 'Create Order'
    
    fill_in 'order_line_items_attributes_0_name', with: 'test item'
    fill_in 'order_line_items_attributes_0_quantity', with: 5
    fill_in 'order_line_items_attributes_0_price', with: 200
    fill_in 'order_line_items_attributes_0_catalogue_number', with: 'ABC000'
    fill_in 'order_line_items_attributes_0_vendor', with: 'test vendor'
    click_on 'Submit Order'
    
    expect(page).to have_content 'Submitted Orders'
  end
end