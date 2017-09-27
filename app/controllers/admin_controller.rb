class AdminController < ApplicationController
  before_action :authenticate_admin!

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to login_path, warning: 'Lo sentimos. Para acceder al dashboard necesitas una cuenta de administrador.'
    end
  end
end
