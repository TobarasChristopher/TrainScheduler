require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  test "should not save schedule without a time" do
    schedule = Schedule.new(origin: "Sample Origin", destination: "Sample destination")
    assert_not schedule.save, "Saved the Schedule without a time"
  end

  test "should save schedule with all attributes" do
    schedule = Schedule.new(origin: "Sample Origin", destination: "Sample destination", schetime: DateTime.parse("2023-12-13 14:30:00"))
    assert schedule.save, "Could not save the schedule with all attributes"
  end
end
