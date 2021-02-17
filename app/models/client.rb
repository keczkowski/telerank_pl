class Client < ApplicationRecord

  paginates_per 10

  has_many :calls, :dependent => :restrict_with_error
  has_many :reminders, :dependent => :restrict_with_error
  has_many :agreements, :dependent => :restrict_with_error
  has_many :events, :dependent => :restrict_with_error

  belongs_to :user

  after_create :create_event1
  after_update :create_event2

  def create_event1
    Event.create(name: 'Dodano nowego klienta', body: self.inspect, client_id: self.id, user_id: self.user_id)
  end

  def create_event2
    Event.create(name: 'Zmieniono dane klienta', body: self.inspect, client_id: self.id, user_id: self.user_id)
  end

  def name
    "#{imie} #{nazwisko}"
  end

end
