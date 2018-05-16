require 'csv'

class ApplicationExporterService
  attr_reader :applications

  def initialize(applications)
    @applications = applications
  end

  def render
    CSV.generate do |csv|
      csv << headers

      applications.each do |application|
        csv << attributes(application)
      end
    end
  end

  private

  def headers
    [
      'created_at',
      'first_name',
      'last_name',
      'email',
      'whatsapp',
      'birthdate',
      'gender',
      'program',
      'referral',
      'city',
      'state',
      'status'
    ]
  end

  def attributes(application)
    application = application
    user        = application.user
    demographic = application.demographic
    address     = application.address
    experience  = application.experience
    recruitment = application.recruitment

    [
      application.created_at,
      user.first_name,
      user.last_name,
      user.email,
      user.whatsapp,
      demographic.try(:birthdate),
      demographic.try(:gender),
      experience.try(:program),
      recruitment.try(:referral),
      address.try(:city),
      address.try(:state),
      application.status
    ]
  end
end
