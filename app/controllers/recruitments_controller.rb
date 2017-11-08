class RecruitmentsController < ApplicationController
  before_action :authenticate!

  def create
    coupon      = params[:recruitment][:coupon]
    recruitment = Recruitment.new(recruitment_params.merge(application: current_application))
    recruitment.add_coupon(coupon) if coupon

    case
    when coupon_is_valid?(recruitment) || can_save?(recruitment)
      current_application.add_step('recruitment')

      flash[:success] = 'Tu información de reclutamiento fue guardada exitosamente.'
      render 'applications/show'
    when coupon_is_invalid?(recruitment)
      current_application.add_step('recruitment')

      flash[:danger] = 'Tu cupón es inválido.'
      render 'applications/show'
    else
      flash[:danger] = 'Tu información de reclutamiento no pudo ser guardada.'
      render 'applications/show'
    end
  end

  def update
    coupon      = params[:recruitment][:coupon]
    recruitment = current_application.recruitment
    recruitment.add_coupon(coupon) if coupon

    case
    when coupon_is_valid?(recruitment) || can_save?(recruitment)
      current_application.add_step('recruitment')

      flash[:success] = 'Tu información de reclutamiento fue actualizada exitosamente.'
      render 'applications/show'
    when coupon_is_invalid?(recruitment)
      current_application.add_step('recruitment')

      flash[:danger] = 'Tu cupón es inválido.'
      render 'applications/show'
    else
      current_application.remove_step('recruitment')

      flash[:danger] = 'Tu información de reclutamiento no pudo ser actualizada.'
      render 'applications/show'
    end
  end

  private

  def coupon
    params[:recruitment][:coupon]
  end

  def can_save?(recruitment)
    coupon.blank? && recruitment.update(recruitment_params)
  end

  def coupon_is_valid?(recruitment)
    coupon && recruitment.add_coupon(coupon) && recruitment.update(recruitment_params)
  end

  def coupon_is_invalid?(recruitment)
    coupon && !recruitment.add_coupon(coupon) && recruitment.update(recruitment_params)
  end

  def recruitment_params
    params.require(:recruitment).permit(:referral)
  end
end
