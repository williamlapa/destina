require 'test_helper'

class ProductsImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get products_imports_new_url
    assert_response :success
  end

  test "should get create" do
    get products_imports_create_url
    assert_response :success
  end

end
