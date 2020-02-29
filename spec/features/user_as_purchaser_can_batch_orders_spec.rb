require 'rails_helper'

feature "User as purchaser can batch orders" do
  before(:each) do
    sign_up_as_purchaser('test name', 'test@email.com')
    create_order(5)
    visit user_path(User.first)

    click_on "Batch Orders"
    @orders = find_all(".singleOrder")
  end

  scenario ", should be able to see orders to batch" do
    expect(@orders.length).to eq(5)
  end

  context "after selecting orders to batch" do
    scenario ", should be able to start ordering for the batch" do
      check_orders
      
    end
  end
end