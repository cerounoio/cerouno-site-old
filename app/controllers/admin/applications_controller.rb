class Admin::ApplicationsController < AdminController
  def show
    @application = Application.find(params[:id])
  end

  def index
    @applications = Application.all
  end
end
