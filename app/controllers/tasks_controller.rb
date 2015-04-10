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

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      render json: @task, status: 200
    else
      render json: @task.errors, status: 422
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    render json: {}, status: 200
  end

  private

    def task_params
      params.require(:task).permit(:description, :completed)
    end

end
