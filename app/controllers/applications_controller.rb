class ApplicationsController < ApplicationController
  before_action :authenticate!

  def show
  end

  def update
    current_application.submitted!

    flash.clear
    flash[:success] = 'Tu aplicación ha sido enviada exitosamente.'

    render 'applications/show'
  end
end
