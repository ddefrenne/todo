class ProjectsController < ApplicationController

  def index
    render json: Project.all, status: 200
  end

  def show
    render json: Project.find(params[:id])
  end

end
