require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it "belongs to an order" do
    @order = Order.new
    @line_item = build(:line_item)
    @order.line_items << @line_item
    
    expect(@line_item.id).to eq(@order.line_items.first.id)
  end
end
