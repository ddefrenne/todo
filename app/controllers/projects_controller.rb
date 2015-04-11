class ProjectsController < ApplicationController

  def index
    render json: Project.all, status: 200
  end

end
