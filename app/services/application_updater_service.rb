class ApplicationUpdaterService
  attr_reader :application, :params

  def initialize(application, params)
    @application = application
    @params      = params.to_hash.deep_symbolize_keys
  end

  def update
    params[:status].present?      ? update_status      : true
    params[:user].present?        ? update_user        : true
    params[:demographic].present? ? update_demographic : true
    params[:address].present?     ? update_address     : true
    params[:experience].present?  ? update_experience  : true
    params[:recruitment].present? ? update_recruitment : true
  end

  private

  def update_status
    application.status = params[:status] if params[:status].present?
    application.save(validate: false)
  end

  def update_user
    user = application.user
    user.attributes = params[:user]
    user.save(validate: false)
  end

  def update_demographic
    demographic = application.demographic || Demographic.new(application: application)
    demographic.attributes = params[:demographic]

    application.add_step('demographic')    if demographic.valid?
    applicaiton.remove_step('demographic') if demographic.invalid?

    demographic.save(validate: false)
  end

  def update_address
    address = application.address || Address.new(application: application)
    address.attributes = params[:address]

    application.add_step('address')    if address.valid?
    applicaiton.remove_step('address') if address.invalid?

    address.save(validate: false)
  end

  def update_experience
    experience = application.experience || Experience.new(application: application)
    experience.attributes = params[:experience]

    application.add_step('experience')    if experience.valid?
    applicaiton.remove_step('experience') if experience.invalid?

    experience.save(validate: false)
  end

  def update_recruitment
    recruitment = application.recruitment || Recruitment.new(application: application)

    recruitment.add_coupon(params[:recruitment][:coupon])
    recruitment.referral = params[:recruitment][:referral]

    application.add_step('recruitment')    if recruitment.valid?
    applicaiton.remove_step('recruitment') if recruitment.invalid?

    recruitment.save(validate: false)
  end
end
