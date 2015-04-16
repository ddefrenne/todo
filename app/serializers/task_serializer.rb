class TaskSerializer < ApplicationSerializer
  attributes :id, :description, :completed, :project_id
end
