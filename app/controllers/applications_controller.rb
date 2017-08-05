class ApplicationsController < ApplicationController
  before_action :authenticate!

  def show
    @application = current_user.application
  end

  def update
  end
end
