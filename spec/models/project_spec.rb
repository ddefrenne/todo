require 'rails_helper'

RSpec.describe Project, :type => :model do
  it "requires a name" do
    subject.save
    expect(subject.errors[:name]).not_to be_empty
  end

  it "can have multiple tasks" do
    subject.name = 'project 1'
    subject.save

    2.times do |n|
      Task.create(description: "task #{n}", project: subject)
    end

    expect(subject.tasks.size).to eql(2)
  end
end
