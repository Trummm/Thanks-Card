require "test_helper"

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get public_home_url
    assert_response :success
  end
end
