class TasksController < ActionController::Base

  def index
    @tasks = Task.all
    render json: @tasks
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: 201
    else
      render json: { errors: @task.errors }, status: 422
    end
  end

  private

    def task_params
      params.require(:task).permit(:description)
    end

end