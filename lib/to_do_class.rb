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
    @my_list.include?(task) ? @my_list.delete(task) : (return "This task is not in the list")
  end
end