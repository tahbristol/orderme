require 'rails_helper'

feature "User can remove line item", js: true do
  scenario "from an order" do
    sign_up('test name', 'test@email.com')
    click_on "Create Order"
    click_on "Add Item"
    
    line_items = page.all(".line_item")
    expect(line_items.size).to eq 2
    
    click_on "X"
    line_items = page.all('.line_item')
    expect(line_items.size).to eq 1
  end
end