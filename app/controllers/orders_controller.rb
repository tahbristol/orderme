class OrdersController < ApplicationController
  
  def index
    @orders = Order.all
  end
  
  def new
    @order = Order.new
  end
  
  def create
    current_user.orders.create(order_params)
    redirect_to user_path current_user
  end
  
  def edit
    @order = Order.find(params[:id])
    if @order.requestor != current_user
      redirect_to order_path(@order)
    end
  end
  
  def update
    current_user.orders.update(order_params)
    redirect_to order_path(@order)
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(
      :requestor_id,
      line_items_attributes: [:id, :name, :quantity, :catalogue_number, :price, :vendor, :_destroy]
    )
  end
end
