require 'rails_helper'

feature "User redirected to user show page" do
  scenario "after signup" do
    sign_up('test name', 'test@email.com')
    
    expect(page).to have_content 'Hi, test name' 
  end
  
  scenario "having already been signed in" do
    sign_up('test name', 'test@email.com')
    
    visit root_path
    
    expect(page).to have_content 'Hi, test name'
  end
end