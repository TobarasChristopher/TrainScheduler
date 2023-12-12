class Schedule < ApplicationRecord
    validates :origin, presence: true
    validates :destination, presence: true
    validates :schetime, presence: true
end
