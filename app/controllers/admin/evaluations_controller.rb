class Admin::EvaluationsController < AdminController
  def show
    @evaluation = Evaluation.find(params[:id])
  end

  def new
    @evaluation = Evaluation.new(application_id: params[:application_id], evaluator_id: current_user.id)
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    application = @evaluation.application

    if @evaluation.save
      application.needs_invitation! if @evaluation.passed?
      application.needs_rejection!  if @evaluation.failed?

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
    application = @evaluation.application

    if @evaluation.update(evaluation_params)
      application.needs_invitation! if @evaluation.passed?
      application.needs_rejection!  if @evaluation.failed?

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
    application.needs_interview_scores!

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
