class Task
  attr_reader(:description)

  def initialize(attributes)
    @description = attributes.fetch(:description)
  end

# Converts SQL database to Ruby Code
  def self.all
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      tasks.push(Task.new({:description => description}))
    end
    tasks
  end

# Sets two objects of the same class equal to one another for testing purposes
  def ==(another_task)
    self.description().==(another_task.description())
  end

# Saves an object to our database table
  def save
    DB.exec("INSERT INTO tasks (description) VALUES ('#{@description}');")
  end
end
