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

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])

    if ApplicationUpdaterService.new(@application, application_params).update
      UserMailer.send(params[:email_message], @application.user).deliver_now if params[:email_message].present?

      flash[:success] = 'La aplicación se ha actualizado exitosamente.'
      render 'admin/applications/show'
    else
      flash[:danger] = 'La aplicación no pudo ser actualizada.'
      render 'admin/applications/show'
    end
  end

  def toggle
    @application = Application.find(params[:id])
    @application.toggle

    flash.clear

    if @application.visible?
      flash[:success] = 'La aplicación se ha vuelto visible exitosamente.'
    else
      flash[:success] = 'La aplicación se ha ocultado exitosamente.'
    end

    render 'admin/applications/show'
  end

  private

  def application_params
    params.require(:application).permit(
      :status,
      user:        [:email, :whatsapp],
      demographic: [:birthday, :gender],
      address:     [:line_1, :line_2, :city, :state, :zipcode],
      experience:  [:education, :income, :technical_experience, :objective, :resume],
      recruitment: [:referral, :coupon]
    )
  end
end
