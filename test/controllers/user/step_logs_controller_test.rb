require "test_helper"

class User::StepLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_step_logs_index_url
    assert_response :success
  end

  test "should get show" do
    get user_step_logs_show_url
    assert_response :success
  end

  test "should get edit" do
    get user_step_logs_edit_url
    assert_response :success
  end
end
