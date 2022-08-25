require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should be able to create a category" do
    category = Category.new
    category.name = "Category"
    category.description = "description"
    assert category.save, "Did not create a category."
  end

  test "should be able to reject a category with empty name" do
    category = Category.new
    assert_not category.save, "Created a category with no name."
  end

  test "should be able to reject a category with name longer than 20 chars" do
    category = Category.new
    category.name = "123456789012345678901"
    category.description = "description"
    assert_not category.save, "Saved a category with a name longer than 20 chars."
  end

  test "should be able to reject a category with empty description" do
    category = Category.new
    category.name = "Category"
    category.description = ""
    assert_not category.save, "Saved a category with no description."
  end

  test "should be able to reject a category with description shorter than 10 chars" do
    category = Category.new
    category.name = "Category"
    category.description = "1"
    assert_not category.save, "Saved a category with description shorter than 10 chars."
  end

  test "should be able to reject a category with description greater than 100 chars" do
    category = Category.new
    category.name = "Category"
    category.description = "12345678901234567890123456789012345678901234567890
                            123456789012345678901234567890123456789012345678901"
    assert_not category.save, "Saved a category with description longer than 100 chars."
  end

  test "should show only tasks of current day"
    category = Category.new
    
  end
end
