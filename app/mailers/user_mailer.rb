class UserMailer < ApplicationMailer
  def welcome(user)
    mail(to: format_to_field(user), subject: 'Solicitud de Admisiones')
  end

  def application_submitted(user)
    mail(to: format_to_field(user), subject: 'Solicitud Enviada')
  end

  def schedule_interview(user)
    mail(to: format_to_field(user), subject: 'Entrevista')
  end

  def send_invitation(user)
    mail(to: format_to_field(user), subject: 'Decisión de Admisiones')
  end

  def send_acceptance_message(user)
    mail(to: format_to_field(user), subject: 'Siguiente Paso')
  end

  def send_declination_message(user)
    mail(to: format_to_field(user), subject: 'Mucho Éxito')
  end

  def send_rejection(user)
    mail(to: format_to_field(user), subject: 'Decisión de Admisiones')
  end

  private

  def format_to_field(user)
    "\"#{user.full_name}\" <#{user.email}>"
  end
end
