class ApplicationsController < ApplicationController
  before_action :authenticate!

  def show
    @demographic = current_application.demographic || Demographic.new(application: current_application)
  end

  def update
  end
end
