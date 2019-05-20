module Features
  def create_other_users_order()
    other_user = User.create(name: 'test name2', email:'test2@email.com', password: 'password', password_confirmation: 'password')
    line_item = LineItem.new(name:'item',vendor:'vend',price:'1',quantity:1)
    other_order = Order.new
    other_order.line_items << line_item
    other_order.requestor = other_user
    other_order.save
    end
  end