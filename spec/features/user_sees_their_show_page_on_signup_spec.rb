require 'rails_helper'

feature "User redirected to user show page" do
  scenario "after signup" do
    visit 'users/sign_up'
    
    fill_in 'user_name', with: 'test name'
    fill_in 'user_email', with: 'test@email.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Sign up'
    
    expect(page).to have_content 'Hi, test name' 
  end
end