require 'test_helper'

class SchedulesFlowTest < ActionDispatch::IntegrationTest
  test "can create a schedule" do
    get "/schedules/new"
    assert_response :success

    assert_difference('Schedule.count') do
      post schedules_path, params: { schedule: { origin: "New Origin", destination: "New destination", schetime: "" } }
    end

    assert_redirected_to schedule_path(assigns(:product))
    follow_redirect!

    assert_select 'p', 'Name: New Schedule'
  end
end