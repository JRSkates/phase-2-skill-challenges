require 'todo'

RSpec.describe Todo do
  context "initialize" do
    it "should set default values and return the task with the task method" do
      todo = Todo.new("Walk the dog")
      expect(todo.task).to eq("Walk the dog")
    end
  end

  context "done and mark_done methods" do
    it 'returns false when asked before completion' do
      todo = Todo.new("Walk the dog")
      expect(todo.done?).to be false
    end

    it "returns true after marked done" do
      todo = Todo.new("Walk the dog")
      todo.mark_done!
      expect(todo.done?).to be true
    end
  end
end