class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
# <<<<<<< HEAD
#     devise_parameter_sanitizer.permit(:account_update, keys: [:postal_code])
# =======
    devise_parameter_sanitizer.permit(:sign_up, keys: [:postal_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:postal_code])
# >>>>>>> a51038c4ab0c9ca73f1469c356138bb3db0871fc
  end
end
