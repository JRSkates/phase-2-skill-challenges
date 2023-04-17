class Todo
  def initialize(task)
    @task = task
  end

  def task
    @task
  end

  def mark_done!
    @task = @task + " DONE"
  end

  def done?
    @task.include? "DONE" ? true : false
  end
end