class Admin::ApplicationsController < AdminController
  def show
    @application = Application.find(params[:id])
  end

  def index
    case
    when params[:status] == 'hidden'
      @applications = Application.hidden.order(updated_at: :desc)
    when params[:status] == 'all'
      @applications = Application.visible.order(updated_at: :desc)
    when params[:status].present?
      @applications = Application.visible.where(status: params[:status]).order(updated_at: :desc)
    end
  end

  def update
    @application = Application.find(params[:id])

    if @application.update(status: params[:status])
      UserMailer.send(params[:email_message], @application.user).deliver_now

      flash.clear
      flash[:success] = 'La aplicación se ha actualizado exitosamente.'

      render 'admin/applications/show'
    else
      flash.clear
      flash[:danger] = 'La aplicación no pudo ser actualizada.'

      render 'admin/applications/show'
    end
  end

  def toggle
    @application = Application.find(params[:id])
    @application.toggle

    flash.clear

    if @application.visible?
      flash.clear
      flash[:success] = 'La aplicación se ha vuelto visible exitosamente.'
    else
      flash.clear
      flash[:success] = 'La aplicación se ha ocultado exitosamente.'
    end

    render 'admin/applications/show'
  end
end
