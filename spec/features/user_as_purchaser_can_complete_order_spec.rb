require 'rails_helper'

feature "User can complete purchasing of order", js: true do
  scenario "when all line items have been checked" do
    sign_up_as_purchaser('test name', 'test@email.com')
    create_other_users_order()

    click_on 'All Orders'

    view_order

    click_on 'Purchase'

    id = Order.last.id
    find("#viewOrder_#{id}").click
    
    click_on 'Begin Ordering'

    check_items(0)

    click_on 'Save'
    click_on 'Complete Order'

    order = Order.last
    expect(order.status).to eq('placed')
  end
end
