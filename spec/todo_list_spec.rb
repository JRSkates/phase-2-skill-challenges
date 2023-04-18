require 'todo_list'

RSpec.describe TodoList do
  it "initializes" do
    todo = TodoList.new
    expect(todo).to eq todo
  end
end