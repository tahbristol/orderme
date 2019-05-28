class HomeController < ApplicationController
  before_action :user_signed_in
  
  def index
  end
  
  def user_signed_in
    if user_signed_in?
      redirect_to user_path current_user
    end
  end
end
