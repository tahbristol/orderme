require 'rails_helper'

feature "User can login without credentials", js: true do
  before(:each) do
    User.create(name: 'Guest', email: 'guest@mail.com', password: 'password', password_confirmation: 'password')
  end

  scenario "as a guest" do
    visit root_path

    click_on "Sign in as guest"
    click_on "Sign in"
    expect(page).to have_content "Hi, Guest"
  end

end
