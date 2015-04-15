class ProjectsController < ApplicationController

  def index
    render json: Project.all, status: 200
  end

  def create
    project = Project.new(project_params)

    if project.save
      render json: project
    else
      render json: { errors: project.errors }, status: 422
    end
  end

  def show
    render json: Project.find(params[:id])
  end

  private

    def project_params
      params.require(:project).permit(:name)
    end
end
