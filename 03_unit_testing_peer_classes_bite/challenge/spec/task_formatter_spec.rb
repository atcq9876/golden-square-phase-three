require "task_formatter"

RSpec.describe TaskFormatter do
  it "it formats and returns an incomplete task" do
    task = double :task, complete?: false
    task_to_format = TaskFormatter.new(task)
    expect(task_to_format.format).to eq "- [ ] Task one"
  end

  it "formats and returns a completed task" do
    task = double :task, complete?: true
    task_to_format = TaskFormatter.new(task)
    expect(task_to_format.format).to eq "- [x] Task one"
  end
end