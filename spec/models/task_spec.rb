require 'rails_helper'

RSpec.describe Task, :type => :model do
  it "requires a description" do
    subject.save
    expect(subject.errors[:description]).not_to be_empty
  end

  it "belongs to a project" do
    project = Project.create(name: 'test-project')

    subject.attributes = {
      description: 'test association',
      project: project
    }
    subject.save

    expect(subject.project.id).to eql(project.id)
  end

  describe "database queries" do
    it "only return completed tasks by default" do
      task1 = Task.create(description: 'task 1', completed: false)
      task2 = Task.create(description: 'task 2', completed: true)

      expect(Task.all).to include(task1)
      expect(Task.all).not_to include(task2)
    end
  end
end
