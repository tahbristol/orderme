require 'rails_helper'

feature 'User as purchaser can mark line items of an order as purchased' do
  scenario 'while an order is pending', js: true do 
    sign_up_as_purchaser('test name', 'test@email.com')
    create_order(1)
    visit user_path(User.first)
    click_on 'All Orders'
    find("#viewOrder_#{Order.first.id}").click
    click_on 'Purchase'
    click_on 'Purchased Queue'
    find("#viewOrder_#{Order.first.id}").click
    
    click_on 'Begin Ordering'
    find("#lineItem_#{LineItem.first.id}").click
    click_on 'Save'
    
    Timeout.timeout(Capybara.default_max_wait_time) do # extract this out
      loop until page.evaluate_script('jQuery.active').zero?
    end
    
    expect(Order.first.line_items.first.purchased).to eq true
    
  end
end
