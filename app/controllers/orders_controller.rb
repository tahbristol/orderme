class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def create
    current_user.orders.create(order_params)
    redirect_to user_path current_user
  end
  
  private
  
  def order_params
    params.require(:order).permit(
      :requestor_id,
      line_items_attributes: [:id, :name, :quantity, :catalogue_number, :price, :vendor, :_destroy]
    )
  end
end
