require 'rails_helper'

feature "User can add notes to order", js: true do
  before(:each) do
    sign_up('test name', 'test@email.com')
  end

  scenario "when creating an order" do
    create_order
    view_order

    note_content = 'test content'

    click_on "Add Note"
    fill_in "note_content", with: note_content

    click_on "Save"
    order = Order.last

    notes = order.notes
    expect(notes.count).to eq(1)
    expect(notes.first.content).to eq note_content
    expect(page).to have_content note_content
  end
end
