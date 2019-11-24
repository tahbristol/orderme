require 'rails_helper'

feature "User can add notes to line items", js: true do
  scenario "" do
    sign_up('test name', 'test@email.com')
    create_order(1)
    view_order
    note_content = 'test note'


    find("#addNoteForItem_#{LineItem.last.id}").click

    fill_in 'note_content', with: note_content
    click_on 'Save'
    
    notes = LineItem.last.notes
    expect(notes.count).to eq(1)
    expect(notes.first.content).to eq note_content
    expect(page).to have_content note_content
  end
end
