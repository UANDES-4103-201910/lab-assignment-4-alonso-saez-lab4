class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types
  validates :start_date, :presence => true
  validate :start_date_cannot_be_earlier_than_created_at
  validate :two_events_at_the_same_event_venue

  def start_date_cannot_be_earlier_than_created_at
    if self.start_date < Date.today
      errors.add(:start_date, 'the event cant start in the past than the creation date')

    end
  end

  def two_events_at_the_same_event_venue
    list_of_events = Event.all
    list_of_events.each {|e|
      if e.start_date == self.start_date && e.event_venue_id == self.event_venue_id
        errors.add(:event_venue_id, 'the event cannot be on the same event venue at the same time with other event')
      end}
  end

end
