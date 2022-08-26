require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should create a task" do
    category = Category.create(name: "name", description: "12345678901")
    task = Task.new
    task.body = "hello"
    task.category_id = category.id
    assert task.save, "Did not create a task."
  end
  
  test "should not create a task without a body" do
    category = Category.create(name: "name", description: "12345678901")
    task = Task.new
    task.category_id = category.id
    assert_not task.save, "Created a task without a body."
  end


  # test "should show only tasks of current day" do
  #   category = Category.create(name: "name", description: "12345678901")
    
  #   task1 = Task.new
  #   task2 = Task.new
  #   task3 = Task.new

  #   task1.body = 'hello'
  #   task2.body = 'hello'
  #   task3.body = 'hello'

  #   task1.category_id = category.id
  #   task2.category_id = category.id
  #   task3.category_id = category.id

  #   task1.due_date = '2022-08-10'
  #   task2.due_date = Date.current
  #   task3.due_date = Date.current

  #   task1.save
  #   task2.save
  #   task3.save

    

  # end

end
