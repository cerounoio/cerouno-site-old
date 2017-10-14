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

  def invitation
    UserMailer.invitation(user)
  end

  def acceptance
    UserMailer.acceptance(user)
  end

  def declination
    UserMailer.declination(user)
  end

  def rejection
    UserMailer.rejection(user)
  end

  private

  def user
    OpenStruct.new({
      full_name: 'Fernanda Sosa',
      email:     'fernanda@example.com',
      token:     'supersecrettoken',
      application: application
    })
  end

  def application
    OpenStruct.new({ id: 1 })
  end
end
