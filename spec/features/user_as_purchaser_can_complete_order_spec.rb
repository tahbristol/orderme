require 'rails_helper'

feature "User can complete purchasing of order", js: true do
  scenario "when all line items have been checked" do
    sign_up_as_purchaser('test name', 'test@email.com')
    create_other_users_order()

    click_on 'All Orders'
    view_order(1)

    click_on 'Purchase'

    click_on 'Begin Ordering'

    check_items(0)
    byebug
    expect(page).to have_content 'Complete Order'
  end
end
