class UserMailer < ApplicationMailer
  def welcome
    mail(to: '"Jorge Tellez" <jorge@cerouno.io>', subject: 'Cuenta Creada')
  end

  def application_submitted
  end
end
