require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without name" do
    user = User.new(name: nil, email: 'test@email.com', password: 'password', password_confirmation: 'password')
    
    expect(user.valid?).to eq false
  end
  
  it "can not have an already used email" do
    user_1 = User.create(name: 'test name', email: 'test@email.com', password: 'password', password_confirmation: 'password')
    
    user_2 = User.create(name: 'test name2', email: 'test@email.com', password: 'password', password_confirmation: 'password')
    
    expect(user_2.errors.messages[:email][0]).to eq 'has already been taken'
  end
end