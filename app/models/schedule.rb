class Schedule < ApplicationRecord
    validates :origin, presence: true
    validates :destination, presence: true
    validates :schetime, presence: true
    validate :schetime_cannot_be_in_the_past

    private

    def schetime_cannot_be_in_the_past
      return unless schetime.present?
  
      current_time = Time.current
      schetime_time = schetime.to_time
  
      if schetime_time.hour < current_time.hour || (schetime_time.hour == current_time.hour && schetime_time.min <= current_time.min)
        errors.add(:schetime, 'cannot be in the past')
      end
    end
  end