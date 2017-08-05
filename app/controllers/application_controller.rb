class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  helper_method :current_user, :current_application

  def current_user
    @current_user ||= User.find_by(user_id: session[:user_id])
  end

  def current_application
    @current_application ||= current_user.application
  end
end
