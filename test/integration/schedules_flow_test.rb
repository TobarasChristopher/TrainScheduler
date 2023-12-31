require 'test_helper'

class SchedulesFlowTest < ActionDispatch::IntegrationTest
  test "can create a schedule" do
    get "/schedules/new"
    assert_response :success

    assert_difference('Schedule.count') do
      post schedules_path, params: { schedule: { origin: "New Origin", destination: "New destination", schetime: DateTime.parse("2024-12-13 23:55:00") } }
    end

    assert_redirected_to schedule_path(assigns(:schedule))
    follow_redirect!

    assert_select 'p', 'Schedule was successfully created.'
  end
end