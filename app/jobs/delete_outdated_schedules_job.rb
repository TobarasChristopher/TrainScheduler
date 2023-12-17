class DeleteOutdatedSchedulesJob < ApplicationJob
  queue_as :default
# Outdated job. Job to check for schedules time if it had passed over the current.
# Not implemented, but left in codebase to understand future possibilities
  def perform(schedule_id)
    schedule = Schedule.find_by(id: schedule_id)
    return unless schedule&.schetime.present?

    current_time = Time.current
    schetime_time = schedule.schetime.strftime("%H:%M:%S")
# Delete job
    if schetime_time <= current_time.strftime("%H:%M:%S")
      schedule.destroy
    end
  end
end