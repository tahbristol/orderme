require 'rails_helper'

feature "User can complete purchasing of order" do
  scenario "when all line items have been checked" do
    sign_up('test name', 'test@email.com')
    create_other_users_order()

    click_on 'All Orders'
    view_order(1)
    purchase_order

    click_on 'Purchase Queue'
    view_order(1)

    click_on 'Begin Ordering'

    check_all_items_and_save

    expect(page).to have_content 'Complete Order'
  end
end
