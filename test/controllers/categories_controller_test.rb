require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)

    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference("Category.count") do
      post categories_url, params: { category: { description: 'description', name: 'name' } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should be able to show a category and tasks associated to it" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: { description: "description", name: "name" } }
    assert_redirected_to category_url(@category)
  end
  
  test "should be able to reject a category update for empty name" do
    patch category_url(@category), params: { category: { description: "description", name: "" } }
    assert_response 422
  end

  test "should be able to reject a category update for name chars greater than 20" do
    patch category_url(@category), params: { category: { description: "description", name: "123456789012345678901" } }
    assert_response 422
  end

  test "should be able to reject a category update for empty description" do
    patch category_url(@category), params: { category: { description: "", name: "name" } }
    assert_response 422
  end

  test "should be able to reject a category update for empty description shorter than 10 chars" do
    patch category_url(@category), params: { category: { description: "1", name: "name" } }
    assert_response 422
  end

  test "should be able to reject a category update for empty description greater than 100 chars" do
    patch category_url(@category), params: { category: { description: "1234567890
                                                                      1234567890
                                                                      1234567890
                                                                      1234567890
                                                                      1234567890
                                                                      1234567890
                                                                      1234567890
                                                                      1234567890
                                                                      1234567890
                                                                      12345678901", name: "name" } }
    assert_response 422
  end

  test "should destroy category" do
    assert_difference("Category.count", -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end

  
end
