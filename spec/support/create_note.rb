module Features
  def create_note(number_of_orders_to_create=1)
    number_of_orders_to_create.times do
      click_on 'Add Note'
      
      fill_in 'note_content', with: 'test item'
      
      click_on 'Save'
    end
  end
end