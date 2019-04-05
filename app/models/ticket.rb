class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order
  validates :start_date, :presence => true
  before_save :ticket_cannot_be_created_after_the_start_date
  before_save :no_ticket_could_be_bought_after_start_date

  def ticket_cannot_be_created_after_the_start_date
    start_date_of_the_event = TicketType.joins(:events).where(events: {event_id: self}.find(:start_date))
    if start_date_of_the_event < Date.today
      errors.add(:start_date, 'the event cant start in the past than the creation date')
    end
  end

  def no_ticket_could_be_bought_after_start_date
    order_date = Order.find(order_id: self).find(:created_at)
    if self.created_at.present? && order_date < self.created_at
      errors.add(:order_date, 'The ticket cannot be bougth after the event start date')
    end
  end

end
