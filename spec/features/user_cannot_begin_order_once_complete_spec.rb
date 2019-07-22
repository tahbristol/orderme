require 'rails_helper'

feature "User as purchaser cannot begin order", js: true do
  scenario "when order status is not pending" do
   sign_up_as_purchaser('test name', 'test@email.com')
   create_order(1)
   visit user_path(User.first)
   click_on "All Orders"
   find("#viewOrder_#{Order.first.id}").click
   
   click_on "Purchase"
   click_on "Begin Ordering"
   check_items(0)
   click_on "Save"
   click_on "Complete Order"
   
   expect(page).not_to have_content "Save"
  end
end