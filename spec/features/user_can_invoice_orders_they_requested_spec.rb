require 'rails_helper'

feature "User can invoice orders they requested", js: true do
  scenario "by checking off items they've received" do
    sign_up_as_purchaser('test name', 'test@name.com')
    create_order
    view_order

    click_on "Purchase"

    id = Order.last.id
    find("#viewOrder_#{id}").click
    
    click_on 'Begin Ordering'
    check_items(0)
    click_on 'Save'
    click_on 'Complete Order'

    click_on 'Your Orders'
    view_order

    click_on 'Invoice'

    check_items(0)
    click_on 'Save'
    click_on 'Complete Invoice'

    @order = Order.last
    expect(@order.recieved_and_invoiced?).to eq true
  end

  scenario "by submitting an order once all items are marked received" do

  end
end
