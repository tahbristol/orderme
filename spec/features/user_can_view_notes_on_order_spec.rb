require 'rails_helper'

feature "User can view notes on order", js: true do
  scenario "that they own" do

    sign_up('test name', 'test@email.com')
    create_order(1)

    find("#viewOrder_#{Order.last.id}").click
    create_note(1)

    click_on "Your Order"

    find("#viewNotesForOrder_#{Order.last.id}").click

    expect(page).to have_css("#orderNote_#{Note.last.id}")
  end
end
