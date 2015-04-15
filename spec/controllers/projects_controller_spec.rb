require 'rails_helper'

RSpec.describe ProjectsController, :type => :controller do
  let(:project1) { Project.create(name: 'project 1') }
  let(:project2) { Project.create(name: 'project 2') }

  describe "#index" do
    before(:example) do
      project1
      project2
      get :index
    end

    it "returns all projects" do
      expect(response.body).to eql(
        ActiveModel::ArraySerializer.new([project1, project2], root: 'projects')
          .to_json
      )
    end

    it "returns a 200" do
      expect(response.status).to eql(200)
    end
  end

  describe "#show" do
    before(:example) do
      project1
      project2
      get :show, { id: project2.id }
    end

    it "returns the correct project" do
      expect(response.body).to eql(
        ProjectSerializer.new(project2).to_json
      )
    end

    it "returns a 200" do
      expect(response.status).to eql(200)
    end
  end
end
