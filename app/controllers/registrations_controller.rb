class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def create
    if params[:user][:role].to_i == 1
      params[:user][:role] = 1
    else
      params[:user][:role] = 0
    end
    super
  end
  
  protected

  def after_sign_up_path_for(resource)
    user_path resource
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :role, :picture])
  end
end