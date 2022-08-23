require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  #passed
  test "should get index" do
    get category_tasks_path(@task.category)
    assert_response :success
  end

  #passed
  test "should get new" do
    get new_category_task_path(@task.category)
    assert_response :success
  end

  
  #passed
  test "should show task" do
    get category_task_url(@task.category, @task)
    assert_response :success
  end

  #passed
  test "should get edit" do
    get edit_category_task_url(@task.category, @task)
    assert_response :success
  end

  test "should update task" do
    patch category_task_url(@task.category, @task), params: { task: { body: @task.body, category_id: @task.category_id } }
    assert_redirected_to category_tasks_path(@task.category)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete category_task_url(@task.category, @task)
    end

    assert_redirected_to category_tasks_path(@task.category)
  end
end
