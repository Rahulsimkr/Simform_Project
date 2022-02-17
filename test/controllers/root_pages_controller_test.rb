require "test_helper"

class RootPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_pages_index_url
    assert_response :success
  end
end
