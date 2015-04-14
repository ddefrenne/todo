require 'rails_helper'

RSpec.describe Project, :type => :model do
  it "can have multiple tasks" do
    subject.save

    2.times do |n|
      Task.create(description: "task #{n}", project: subject)
    end

    expect(subject.tasks.size).to eql(2)
  end
end
