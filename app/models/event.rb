class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types
  validates :start_date, :presence => true
  validate :start_date_cannot_be_earlier_than_created_at
  #validate :two_events_at_the_same_event_venue

  def start_date_cannot_be_earlier_than_created_at
    if self.start_date < Date.today
      errors.add(:start_date, 'the event cant start in the past than the creation date')

    end
  end

  def two_events_at_the_same_event_venue
    sd = self.start_date
    evi = self.event_venue_id
    count_of_events = Event,where("start_date = :start_date AND event_venue_id = :event_venue_id", {:start_date => sd, :event_venue_id => evi}).count
    if count_of_events > 0
      errors.add(:events, 'the event cannot be on the same event venue at the same time with other event')
    end
  end

end
