require "task_list"
require "task"
require "task_formatter"

RSpec.describe "tasks integration" do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end

  it "it formats and returns an incomplete task" do
    task = Task.new("Task one")
    task_to_format = TaskFormatter.new(task)
    expect(task_to_format.format).to eq "- [ ] Task one"
  end

  it "formats and returns a completed task" do
    task = Task.new("Task one")
    task_to_format = TaskFormatter.new(task)
    task.mark_complete
    expect(task_to_format.format).to eq "- [x] Task one"
  end
end
