# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.welcome(user)
  end

  def application_submitted
    UserMailer.application_submitted(user)
  end

  def schedule_interview
    UserMailer.schedule_interview(user)
  end

  def send_invitation
    UserMailer.send_invitation(user)
  end

  def send_acceptance_message
    UserMailer.send_acceptance_message(user)
  end

  def send_declination_message
    UserMailer.send_declination_message(user)
  end

  def send_rejection
    UserMailer.send_rejection(user)
  end

  private

  def user
    OpenStruct.new({
      full_name: 'Fernanda Sosa',
      email:     'fernanda@example.com'
    })
  end
end
