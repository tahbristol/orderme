require 'rails_helper'

feature "User can sign up as a purchaser" do
  scenario "successfully" do
    sign_up_as_purchaser('test name', 'test@email.com')
    user = User.first
    expect(user.purchaser?).to eq true
  end
end