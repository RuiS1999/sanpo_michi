require "test_helper"

class User::FollowsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_follows_index_url
    assert_response :success
  end
end
