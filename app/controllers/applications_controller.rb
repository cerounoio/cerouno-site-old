class ApplicationsController < ApplicationController
  before_action :authenticate!

  def show
  end

  def update
    current_application.submitted!

    UserMailer.application_submitted(current_user).deliver_now

    flash.clear
    flash[:success] = 'Tu aplicación ha sido enviada exitosamente.'

    render 'applications/show'
  end
end
