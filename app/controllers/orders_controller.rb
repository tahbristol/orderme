class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @line_items = @order.line_items.build
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
    @order = Order.includes(:line_items).find(params[:id])
    render :show
  end

  def purchase
    @order = Order.find(params[:order_id])
    if @order.requested?
      @order.update(purchaser_id: current_user.id, status: :pending)
      flash[:notice] = "This order has been moved to your purchasing queue"
    else
      flash[:notice] = "This order already has a purchaser"
    end
    redirect_to @order
  end

  def purchased_queue
    @orders = Order.purchased.where(purchaser: current_user)
    render :index
  end

  def begin
    @order = Order.includes(:line_items).find(params[:order_id])
    render :show_begin
  end
  
  def update_line_items
    items = params[:items].split("|")
    items.each do |item|
      item_hash = JSON.parse(item)
      line_item = Order.find(params[:order_id]).line_items.where(id: item_hash["id"])
      line_item.update(purchased: item_hash["purchased"])
    end
  end
  
  def complete
    @order = Order.find_by(id: params[:order_id])
    @order.update(status: :placed)
    flash[:notice] = "This order has been marked as placed"
    render :show_begin
  end
  
  def invoice
    #byebug
    items = params[:items].split("|")
    items.each do |item|
      items_hash = JSON.parse(item)
      line_item = Order.find(params[:order_id]).line_items.where(id: item_hash["id"])
      line_item.update(invoiced: item_hash["invoiced"])
    end
  end
  
  private

  def order_params
    params.require(:order).permit(
      :requestor_id,
      line_items_attributes: [:id, :name, :quantity, :catalogue_number, :price, :vendor, :_destroy]
    )
  end
end
