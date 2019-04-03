class EventVenue < ApplicationRecord
  validates :name, length: {minimum: 20}, message: 'Your event name has less than 20 characters'
  validates :capacity, numericality: {greater_than: 0}, message: 'Your event capacity has to be positive'
end
