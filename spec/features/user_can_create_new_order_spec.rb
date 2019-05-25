require 'rails_helper'

feature "User can create new order" do
  before(:each) do
    sign_up('test name', 'test@email.com')
  end
  
  scenario "successfully" do
    create_order
    
    expect(page).to have_content 'Orders'
  end
end