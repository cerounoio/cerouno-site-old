class Admin::EvaluationsController < AdminController
  def show
    @evaluation = Evaluation.find(params[:id])
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)

    if @evaluation.save
      flash.clear
      flash[:success] = 'La evaluación se ha creado exitosamente.'

      render 'admin/evaluations/show'
    else
      flash.clear
      flash[:danger] = 'La evaluación no pudo ser creada.'

      render 'admin/evaluations/new'
    end
  end

  def edit
    @evaluation = Evaluation.find(params[:id])
  end

  def update
    @evaluation = Evaluation.find(params[:id])

    if @evaluation.update(status: params[:status])
      flash.clear
      flash[:success] = 'La evaluación se ha actualizado exitosamente.'

      render 'admin/evaluations/show'
    else
      flash.clear
      flash[:danger] = 'La evaluación no pudo ser actualizada.'

      render 'admin/evaluations/edit'
    end
  end

  def destroy
    evaluation  = Evaluation.find(params[:id])
    application = evaluation.application
    evaluation.destroy

    flash[:success] = 'La evaluación ha sido destruída exitosamente.'

    redirect_to admin_application_path(id: application.id)
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(
      :initiative,
      :collaboration,
      :organization,
      :diversity,
      :resilience,
      :logic,
      :application_id,
      :evaluator_id
    )
  end
end
