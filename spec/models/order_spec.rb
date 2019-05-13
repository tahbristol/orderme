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
  
  describe "#total_price" do
    it "returns the total order price" do
      @order = Order.new
      
      @line_item_1 = LineItem.create({name:'test name 1', quantity: 1, price: 100, catalogue_number: 'ABC', vendor: 'test vendor'})
      @line_item_2 = LineItem.create({name:'test name 2', quantity: 3, price: 200, catalogue_number: 'efg', vendor: 'test vendor'})
      @line_item_3 = LineItem.create({name:'test name 3', quantity: 1, price: 300, catalogue_number: 'hij', vendor: 'test vendor'})
      @line_item_4 = LineItem.create({name:'test name 4', quantity: 1, price: 50, catalogue_number: 'xyz', vendor: 'test vendor'})
      
      @order.line_items = [@line_item_1, @line_item_2, @line_item_3, @line_item_4]
      expect(@order.total_price).to eq 1050
    end
  end
end
