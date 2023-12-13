require 'test_helper'

class SchedulesFlowTest < ActionDispatch::IntegrationTest
  test "can create a schedule" do
    get "/schedules/new"
    get schedule_path(schedule.id)
    assert_response :success

    assert_difference('Schedule.count') do
      post schedules_path, params: { schedule: { origin: "New Origin", destination: "New destination", schetime: DateTime.parse("2023-12-13 14:30:00") } }
    end

    assert_redirected_to schedule_path(assigns(:schedule))
    follow_redirect!

    assert_select 'p', 'Name: New Schedule'
  end
end