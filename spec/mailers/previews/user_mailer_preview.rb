# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.welcome
  end

  def application_submitted
    UserMailer.application_submitted
  end
end
