class OrdersController < ApplicationController
  include ItemsHelper

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
    @order = Order.find_by(id: params[:order][:noteable_id])
    @order.update(order_params)

    redirect_to order_path(@order)
  end

  def show
    @order = Order.includes(:line_items).find(params[:id])
    render :show
  end

  def purchase
    @order = Order.find(params[:order_id])
    flash[:notice] = @order.update_on_purchase(current_user.id)
    redirect_to "/orders"
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
    update_for_each_item(items, params[:order_id])
  end

  def complete
    @order = Order.find_by(id: params[:order_id])
    @order.update(status: :placed)
    flash[:notice] = "This order has been marked as placed"
    redirect_to order_path(@order)
  end

  def invoice
    @order = Order.find_by(id: params[:order_id])
    @order.update(status: :recieved_and_invoiced)
    flash[:notice] = "This order has been marked as received and invoiced"
    redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(
      :requestor_id,
      line_items_attributes: [:id, :name, :quantity, :catalogue_number, :price, :vendor, :_destroy],
      notes_attributes: [:content]
    )
  end
end
