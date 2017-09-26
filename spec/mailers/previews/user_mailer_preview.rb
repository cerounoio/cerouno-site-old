# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.welcome(user)
  end

  def application_submitted
    UserMailer.application_submitted(user)
  end

  private

  def user
    OpenStruct.new({
      full_name: 'Fernanda Sosa',
      email:      'fernanda@example.com'
    })
  end
end
