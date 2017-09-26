class UserMailer < ApplicationMailer
  def welcome(user)
    mail(to: format_to_field(user), subject: 'Solicitud de Admisiones')
  end

  def application_submitted(user)
    mail(to: format_to_field(user), subject: 'Solicitud Enviada')
  end

  private

  def format_to_field(user)
    "\"#{user.full_name}\" <#{user.email}>"
  end
end
