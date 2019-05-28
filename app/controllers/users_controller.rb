class UsersController < ApplicationController
  def show
    @user = User.includes(:orders).find(params[:id])
    render :show
  end
end
