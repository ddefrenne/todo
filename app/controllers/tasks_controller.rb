class TasksController < ActionController::Base

  def index
    @tasks = Task.all
    render json: @tasks
  end

end