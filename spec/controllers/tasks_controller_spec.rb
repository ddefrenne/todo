require 'rails_helper'

RSpec.describe TasksController, :type => :controller do
  describe "#index" do
    before(:context) do
      2.times do |n|
        Task.create(description: "task #{n}")
      end
    end

    it "returns a JSON of all tasks" do
      get :index
      expect(response.body).to eql(
        ActiveModel::ArraySerializer.new(Task.all, root: 'tasks').to_json
      )
      expect(response.status).to eql(200)
    end
  end

  describe "#create" do
    context "on success" do
      before(:example) {
        post :create, { task: { description: 'test' }}
      }

      it "returns the created task" do
        expect(response.body).to eql(
          TaskSerializer.new(Task.last).to_json
        )
      end

      it "returns a 201" do
        expect(response.status).to eql(201)
      end
    end

    context "on failure" do
      before(:example) {
        post :create, { task: { description: '' }}
      }

      it "returns the errors" do
        expect(response.body).to eql(
          { errors: { description: ["can't be blank"] } }.to_json
        )
      end

      it "returns a 422" do
        expect(response.status).to eql(422)
      end
    end
  end

  describe "#update" do
    let!(:task) { Task.create(description: 'task desc 1') }

    context "on success" do
      before(:example) do
        put :update, { id: task.id, task: { description: 'task desc 2' } }
      end

      it "returns the updated task" do
        expect(response.body).to eql(
          TaskSerializer.new(task.reload).to_json
        )
      end

      it "returns a 200" do
        expect(response.status).to eql(200)
      end
    end

    context "on failure" do
      before(:example) do
        put :update, { id: task.id, task: { description: '' } }
      end

      it "returns the updated task" do
        expect(response.body).to eql(
          { errors: { description: ["can't be blank"] } }.to_json
        )
      end

      it "returns a 422" do
        expect(response.status).to eql(422)
      end
    end
  end

  describe "#destroy" do
    let(:task) { Task.create(description: 'destroy task') }

    it "removes the task from the db" do
      task
      expect { delete :destroy, { id: task.id } }.to change { Task.count }.by(-1)
    end

    it "returns a 204" do
      delete :destroy, { id: task.id }
      expect(response.status).to eql(204)
    end
  end

end
