require 'rails_helper'

RSpec.describe Order, type: :model do
  it "can have many line items" do
    @order = Order.new
    
    @line_item_1 = build(:line_item) 
    @line_item_2 = build(:line_item)
    
    @order.line_items << @line_item_1
    @order.line_items << @line_item_2
    
    expect(@order.line_items.size).to eq 2
  end
  
  describe "#total_price" do
    it "returns the total order price" do
      @order = Order.new
      
      @line_item_1 = build(:line_item)
      @line_item_2 = build(:line_item)
      @line_item_3 = build(:line_item)
      @line_item_4 = build(:line_item)
      
      @order.line_items = [@line_item_1, @line_item_2, @line_item_3, @line_item_4]
      expect(@order.total_price).to eq 400
    end
  end
  
  describe ".purchased" do
    it "returns the orders that have a purchasor_id" do
      @purchased_order = build(:order)
      @non_purchased_order = build(:order)
      @purchased_order.purchaser = create(:user)
      @purchased_order.save
      
      @purchased_orders = Order.purchased
      
      expect(@purchased_orders.count).to eq 1
      expect(@purchased_orders.first).to eq @purchased_order
    end
  end
  
  describe "#display_total" do
    it "returns human readable total price" do
      @order = Order.new
      
      @line_item_1 = build(:line_item)
      @line_item_2 = build(:line_item)
      @line_item_3 = build(:line_item)
      @line_item_4 = build(:line_item)
      
      @order.line_items = [@line_item_1, @line_item_2, @line_item_3, @line_item_4]
      expect(@order.display_total).to eq "$4.00"
    end
  end
end
