# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.
As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby

class ToDoClass
  def initialize 
    @my_list = []
  end

  def add(task) # task is a string
    @my_list.push(task)
  end

  def list
     @my_list.each { |t| puts t }
  end

  def complete(task) 

  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1 - New class object initlizes an empty array
new_list = ToDoClass.new
expect(new_list.list).to eq []

# 2 add method adds string to the list and list method returns it
new_list = ToDoClass.new
new_list.add("Go for a run")
expect(new_list.list).to eq ["Go for a run"]

# 3 add method can add multiple strings to the list and list methods returns them all
new_list = ToDoClass.new
new_list.add("Go for a run")
new_list.add("Go to the shops")
new_list.add("Walk the dog")
expect(new_list.list).to eq ["Go for a run", "Go to the shops", "Walk the dog"]

# 4 complete method removes string from the list
new_list = ToDoClass.new
new_list.add("Go for a run")
new_list.add("Go to the shops")
new_list.add("Walk the dog")
new_list.complete("Go to the shops")
expect(new_list.list).to eq ["Go for a run", "Walk the dog"]
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
