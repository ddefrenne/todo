class ProjectsController < ApplicationController

  def index
    render json: Project.all
  end

  def create
    project = Project.new(project_params)

    if project.save
      render json: project, status: 201
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
