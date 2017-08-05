class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  helper_method :current_user, :current_application

  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  def current_application
    @current_application ||= current_user.application
  end

  def authenticate!
    unless current_user
      redirect_to login_path, warning: 'Lo sentimos. Para acceder a la plataforma debes utilizar tu email y password.'
    end
  end
end
