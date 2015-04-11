class Task < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :description

  default_scope { where(completed: false) }
end
