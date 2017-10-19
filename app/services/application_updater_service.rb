class ApplicationUpdaterService
  attr_reader :application, :params

  def initialize(application, params)
    @application = application
    @params      = params.to_hash.deep_symbolize_keys
  end

  def update
    update_status      if params[:status]
    update_user        if params[:user]
    update_demographic if params[:demographic]
    update_address     if params[:address]
    update_experience  if params[:experience]
    update_recruitment if params[:recruitment]
  end

  private

  def update_status
    application.update(status: params[:status]) if params[:status].present?
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
