class AddressesController < ApplicationController
  before_action :authenticate!

  def create
    address = Address.new(address_params.merge(application: current_application))

    if address.save
      current_application.add_step('address')

      redirect_back fallback_location: application_path(current_application), success: 'Tu dirección fue guardada exitosamente.'
    else
      redirect_back fallback_location: application_path(current_application), danger: 'Tu dirección no pudo ser guardada exitosamente.'
    end
  end

  def update
    address = current_application.address

    if address.update(address_params)
      redirect_back fallback_location: application_path(current_application), success: 'Tu dirección fue actualizada exitosamente.'
    else
      current_application.remove_step('address')

      redirect_back fallback_location: application_path(current_application), danger: 'Tu dirección no pudo ser actualizada exitosamente.'
    end
  end

  private

  def address_params
    params.require(:address).permit(
      :line_1,
      :line_2,
      :city,
      :state,
      :zipcode
      )
  end
end
