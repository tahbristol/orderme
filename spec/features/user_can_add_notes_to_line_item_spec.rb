require 'rails_helper'

feature "User can add notes to line items" do
  scenario "" do
    sign_up('test name', 'test@email.com')
    create_order(1)
    view_order
    
    find("#addNoteForItem_#{LineItem.last.id}").click
    fill_in 'note_content', with: 'test item'
    click_on 'Save'
    
    note = LineItem.last.notes.first
    expect(note).not_to eq(nil)
  end
end