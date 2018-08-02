class ApplicationsController < ApplicationController
  before_action :authenticate!, except: [:decide]

  def show
  end

  def update
    current_application.submitted!

    UserMailer.application_submitted(current_user).deliver_now

    flash[:success] = 'Tu aplicación ha sido enviada exitosamente.'
    render 'applications/show'
  end

  def decide
    application = Application.find(params[:id])
    user        = application.user

    if user.token == params[:token]
      application.update_column(:status, params[:status])
      user.update_column(:token, SecureRandom.hex(20))

      UserMailer.acceptance(user).deliver_now  if application.accepted_invitation?
      UserMailer.declination(user).deliver_now if application.declined_invitation?

      redirect_to root_path, success: 'Tu respuesta ha sido registrada exitosamente. Te hemos enviado un correo.'
    else
      redirect_to root_path, warning: 'Lo sentimos. Para actualizar tu aplicación necesitas tener una cuenta válida.'
    end
  end
end
