class DemographicsController < ApplicationController
  before_action :authenticate!

  def create
    demographic = Demographic.new(demographic_params.merge(application: current_application))

    if demographic.save
      current_application.add_step('demographic')

      redirect_back fallback_location: application_path(current_application), success: 'Tu información demográfica fue guardada exitosamente.'
    else
      redirect_back fallback_location: application_path(current_application), danger: 'Tu información demográfica no pudo ser guardada exitosamente.'
    end
  end

  def update
    demographic = current_application.demographic

    if demographic.update(demographic_params)
      redirect_back fallback_location: application_path(current_application), success: 'Tu información demográfica fue actualizada exitosamente.'
    else
      current_application.remove_step('demographic')

      redirect_back fallback_location: application_path(current_application), danger: 'Tu información demográfica no pudo ser actualizada exitosamente.'
    end
  end

  private

  def demographic_params
    params.require(:demographic).permit(
      :birthdate,
      :gender
      )
  end
end
