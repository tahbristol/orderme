class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def purchased_queue
    @orders = current_user.orders.purchased
    render 'orders/index'
  end
end
