class TodoList
  def initialize
    @list = []
  end

  def add(todo)
    fail "This task is not from the Todo class" unless todo.is_a?(Todo)
    @list << todo
  end

  def incomplete
    incomplete = []
    @list.each { |todo| incomplete << todo if todo.done? == false }
    incomplete
  end

  def complete
    complete = []
    @list.each { |todo| complete << todo if todo.done? == true }
    complete
  end

  def give_up!
    @list.each { |todo| todo.mark_done! }
  end

end