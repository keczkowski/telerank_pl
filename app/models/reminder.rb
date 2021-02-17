class Reminder < ApplicationRecord
  paginates_per 10
  belongs_to :user
  belongs_to :client
  has_many :agreements, :dependent => :restrict_with_error

  validates_presence_of :name
  validates_presence_of :remind_at

  after_create :create_event1
  after_update :create_event2

  def create_event1
    Event.create(name: 'Dodano nowe przypomnienie', body: self.inspect, client_id: self.client_id, user_id: self.user_id, reminder_id: self.id)
  end

  def create_event2
    Event.create(name: 'Zmieniono dane przypomnienia', body: self.inspect, client_id: self.client_id, user_id: self.user_id, reminder_id: self.id)
  end

end
