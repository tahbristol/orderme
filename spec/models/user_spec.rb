require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without name" do
    user = build(:user)
    user.name = nil
    
    expect(user.valid?).to eq false
  end
  
  it "can not have an already used email" do
    user_1 = create(:user)
    
    attrs = attributes_for(:user)
    user_2 = User.create(attrs)
    
    expect(user_2.errors.messages[:email][0]).to eq 'has already been taken'
  end
  
  it "has a default role as requestor" do
    user = build(:user)
    
    expect(user).to respond_to(:role)
    expect(user.requestor?).to eq true
  end
  
  it "can be created with role as purchaser" do
    attrs = attributes_for(:user).merge(role: 1)
    user = User.new(attrs)
    
    expect(user.purchaser?).to eq true
  end
  
  describe "#purchased_orders" do
    it "returns orders if user as purchaser has orders they've purchased or are purchasing" do
      attrs = attributes_for(:user).merge(role: 1)
      user = User.create(attrs)
      attrs = attributes_for(:order).merge(requestor_id: user.id, purchaser_id: user.id, status: :pending)
      order = Order.create(attrs)
      user.orders << order
      
      expect(user.purchased_orders.size).to eq 1
    end
  end
  
end