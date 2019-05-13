require 'rails_helper'

RSpec.describe Order, type: :model do
  it "can have many line items" do
    @order = Order.new
    
    @line_item_1 = LineItem.create({name:'test name', quantity: 1, price: 100, catalogue_number: 'ABC', vendor: 'test vendor'})
    @line_item_2 = LineItem.create({name:'test name', quantity: 1, price: 100, catalogue_number: 'ABC', vendor: 'test vendor'})
    
    @order.line_items << @line_item_1
    @order.line_items << @line_item_2
    
    expect(@order.line_items.size).to eq 2
  end
end
