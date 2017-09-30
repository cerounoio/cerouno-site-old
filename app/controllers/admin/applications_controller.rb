class Admin::ApplicationsController < AdminController
  def show
    @application = Application.find(params[:id])
  end

  def index
    @applications = Application.all
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
      flash[:success] = 'La aplicación no pudo ser actualizada.'

      render 'admin/applications/show'
    end
  end
end
