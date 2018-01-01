require 'test_helper'

class UserActivityHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_activity_history = user_activity_histories(:one)
  end

  test "should get index" do
    get user_activity_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_user_activity_history_url
    assert_response :success
  end

  test "should create user_activity_history" do
    assert_difference('UserActivityHistory.count') do
      post user_activity_histories_url, params: { user_activity_history: { points_earned: @user_activity_history.points_earned } }
    end

    assert_redirected_to user_activity_history_url(UserActivityHistory.last)
  end

  test "should show user_activity_history" do
    get user_activity_history_url(@user_activity_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_activity_history_url(@user_activity_history)
    assert_response :success
  end

  test "should update user_activity_history" do
    patch user_activity_history_url(@user_activity_history), params: { user_activity_history: { points_earned: @user_activity_history.points_earned } }
    assert_redirected_to user_activity_history_url(@user_activity_history)
  end

  test "should destroy user_activity_history" do
    assert_difference('UserActivityHistory.count', -1) do
      delete user_activity_history_url(@user_activity_history)
    end

    assert_redirected_to user_activity_histories_url
  end
end
