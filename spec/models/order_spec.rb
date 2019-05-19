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
end
