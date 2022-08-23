require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not create a task without a body" do
    task = Task.new
    assert_not task.save, "Created a task without a body."
  end
end
