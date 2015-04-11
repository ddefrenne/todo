class TasksController < ActionController::Base

  def index
    if params
      @tasks = filter_tasks_by_params
    else
      @tasks = Task.all
    end

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

    render json: {}, status: 204
  end

  private

    def task_params
      params.require(:task).permit(:description, :completed)
    end

    def filter_tasks_by_params
      keys, values = [], []
      sanitized_params = params.extract!(:description, :completed)

      sanitized_params.each do |param|
        keys << param[0]
        if ['true', 'false'].include?(param[1])
          param[1] = param[1] == 'true' ? true : false
        end
        values << param[1]
      end

      query = keys.inject([]) { |query_by, key| query_by << "#{key} = ?" }
        .join(" AND ")

      Task.where(query, *values)
    end

end
