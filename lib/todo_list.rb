class TodoList
  def initialize
    @list = []
  end

  def add(todo)
    @list << todo
  end

  def incomplete
  # Returns all non-done todos
  end

  def complete
  # Returns all complete todos
  end

  def give_up!
  # Marks all todos as complete
  end

end