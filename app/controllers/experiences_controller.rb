class ExperiencesController < ApplicationController
  before_action :authenticate!

  def create
    experience = Experience.new(experience_params.merge(application: current_application))

    if experience.save
      current_application.add_step('experience')

      flash.clear
      flash[:success] = 'Tu experiencia fue guardada exitosamente.'

      render 'applications/show'
    else
      flash.clear
      flash[:danger] = 'Tu experiencia no pudo ser guardada.'

      render 'applications/show'
    end
  end

  def update
    experience = current_application.experience

    if experience.update(experience_params)
      flash.clear
      flash[:success] = 'Tu experiencia fue actualizada exitosamente.'

      render 'applications/show'
    else
      current_application.remove_step('experience')

      flash.clear
      flash[:danger] = 'Tu experiencia no pudo ser actualizada.'

      render 'applications/show'
    end
  end

  private

  def experience_params
    params.require(:experience).permit(
      :education,
      :income,
      :technical_experience,
      :objective,
      :resume,
      )
  end
end
