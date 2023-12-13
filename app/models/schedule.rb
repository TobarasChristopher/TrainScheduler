class Schedule < ApplicationRecord
    validates :origin, presence: true
    validates :destination, presence: true
    validates :schetime, presence: true
    validate :schetime_cannot_be_in_the_past

    private

    def schetime_cannot_be_in_the_past
        errors.add(:schetime, 'cannot be in the past') if schetime.present? && schetime < Time.current
    end

end
