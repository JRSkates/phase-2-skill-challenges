require 'todo'
require 'todo_list'

RSpec.describe 'TodoList Integration' do
  context "TodoList Add Method" do
    it 'fails if the object is not a from the Todo class' do
      result = TodoList.new
      todo = 'task'
      expect { result.add(todo) }.to raise_error "This task is not from the Todo class"
    end

    it 'adds a todo to the list, shows in incomplete' do
      result = TodoList.new
      todo = Todo.new("Walk the dog")
      todo2 = Todo.new("Walk the cat")
      result.add(todo)
      result.add(todo2)
      expect(result.incomplete).to eq([todo, todo2])
    end

    it 'adds a todo to the list, shows in complete' do
      result = TodoList.new
      todo = Todo.new("Walk the dog")
      todo2 = Todo.new("Walk the cat")
      result.add(todo)
      result.add(todo2)
      todo.mark_done!
      todo2.mark_done!
      expect(result.complete).to eq([todo, todo2])
    end

    it "marks all todos as complete with the give_up method" do
      result = TodoList.new
      todo1 = Todo.new("Walk the dog")
      todo2 = Todo.new("Walk the cat")
      todo3 = Todo.new("Walk the hamster")
      todo4 = Todo.new("Walk the fish")
      todo5 = Todo.new("Walk the cat again")
      todo6 = Todo.new("Walk the hamster again")
      result.add(todo1)
      result.add(todo2)
      result.add(todo3)
      result.add(todo4)
      result.add(todo5)
      result.add(todo6)
      result.give_up!
      expect(result.complete).to eq([todo1, todo2, todo3, todo4, todo5, todo6])
    end
  end
end