class DemographicsController < ApplicationController
  before_action :authenticate!

  def create
    demographic = Demographic.new(demographic_params.merge(application: current_application))

    if demographic.save
      current_application.add_step('demographic')

      flash.clear
      flash[:success] = 'Tu información demográfica fue guardada exitosamente.'

      render 'applications/show'
    else
      flash.clear
      flash[:danger] = 'Tu información demográfica no pudo ser guardada.'

      render 'applications/show'
    end
  end

  def update
    demographic = current_application.demographic

    if demographic.update(demographic_params)
      current_application.add_step('demographic')

      flash.clear
      flash[:success] = 'Tu información demográfica fue actualizada exitosamente.'

      render 'applications/show'
    else
      current_application.remove_step('demographic')

      flash.clear
      flash[:danger] = 'Tu información demográfica no pudo ser actualizada.'

      render 'applications/show'
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
