class AddressesController < ApplicationController
  before_action :authenticate!

  def create
    address = Address.new(address_params.merge(application: current_application))

    if address.save
      current_application.add_step('address')

      flash.clear
      flash[:success] = 'Tu dirección fue guardada exitosamente.'

      render 'applications/show'
    else
      flash.clear
      flash[:danger] = 'Tu dirección no pudo ser guardada.'

      render 'applications/show'
    end
  end

  def update
    address = current_application.address

    if address.update(address_params)
      flash.clear
      flash[:success] = 'Tu dirección fue actualizada exitosamente.'

      render 'applications/show'
    else
      current_application.remove_step('address')

      flash.clear
      flash[:danger] = 'Tu dirección no pudo ser actualizada.'

      render 'applications/show'
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
