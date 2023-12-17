class Schedule < ApplicationRecord
  # validating data if it is not null, and if schetime isnt in the past
    validates :origin, presence: true
    validates :destination, presence: true
    validates :schetime, presence: true
    validate :schetime_cannot_be_in_the_past

    private
# Schetime check method
    def schetime_cannot_be_in_the_past
      return unless schetime.present?
  
      current_time = Time.current
      schetime_time = schetime.to_time
      # Check if the hour, minute is not less than the current
      if schetime_time.hour < current_time.hour || (schetime_time.hour == current_time.hour && schetime_time.min <= current_time.min)
        #return error
        errors.add(:schetime, 'cannot be in the past')
      end
    end


  end