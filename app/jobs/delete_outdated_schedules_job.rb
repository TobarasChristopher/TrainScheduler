class DeleteOutdatedSchedulesJob < ApplicationJob
  queue_as :default

  def perform(schedule_id)
    schedule = Schedule.find_by(id: schedule_id)
    return unless schedule&.schetime.present?

    current_time = Time.current
    schetime_time = schedule.schetime.strftime("%H:%M:%S")

    if schetime_time <= current_time.strftime("%H:%M:%S")
      schedule.destroy
    end
  end
end