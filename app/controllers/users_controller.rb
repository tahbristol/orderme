class UsersController < ApplicationController
  def show
    @user = User.includes(:orders).find(params[:id])
    render :show
  end

  def picture
    @user = current_user
  end

  def add_picture
    @user = User.find_by(id: params[:user_id])
    @user.attach_picture(user_params[:picture])
    redirect_to user_path(@user)
  end

  def purchased_queue
    @orders = current_user.purchased_orders
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:picture)
  end
end
