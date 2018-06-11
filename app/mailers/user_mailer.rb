class UserMailer < ApplicationMailer
  def welcome(user)
    mail(to: format_to_field(user), bcc: executive_director, subject: 'Solicitud de Admisiones')
  end

  def application_submitted(user)
    mail(to: format_to_field(user), bcc: executive_director, subject: 'Solicitud Enviada')
  end

  def schedule_interview(user)
    mail(to: format_to_field(user), bcc: executive_director, subject: 'Entrevista')
  end

  def invitation(user)
    @user = user
    mail(to: format_to_field(user), bcc: executive_director, subject: 'Decisión de Admisiones')
  end

  def acceptance(user)
    mail(to: format_to_field(user), cc: operations_manager, bcc: executive_director, subject: 'Bienvenido/a')
  end

  def declination(user)
    mail(to: format_to_field(user), bcc: executive_director, subject: 'Mucho Éxito')
  end

  def rejection(user)
    mail(to: format_to_field(user), bcc: executive_director, subject: 'Decisión de Admisiones')
  end

  private

  def format_to_field(user)
    "\"#{user.full_name}\" <#{user.email}>"
  end

  def operations_manager
    '"Alice Aguirre" <alice@cerouno.io>'
  end

  def executive_director
    '"Jorge Téllez" <jorge@cerouno.io>'
  end
end
