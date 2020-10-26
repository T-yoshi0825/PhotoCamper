class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email])
      # sign_upの際にnameのデータ操作を許。追加したカラム。
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_home_path
    when @user
      images_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    else
      root_path
    end
  end
end
