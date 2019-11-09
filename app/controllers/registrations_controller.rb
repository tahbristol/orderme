class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    params[:user][:role] = params[:user][:role].to_i
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
