require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it "belongs to an order" do
    @order = Order.new
    @line_item = build(:line_item)
    @order.line_items << @line_item
    expect(@line_item.id).to eq(@order.line_items.first.id)
  end
  
  it "returns a number for its price" do
    @line_item = create(:order).line_items.first
    
    expect(@line_item.price.class).to eq Integer
  end
  
  describe "#display_price" do
    it "returns a human readable price" do
      @line_item = create(:order).line_items.first
      
      expect(@line_item.display_price).to eq '$100.00'
    end
  end
end
