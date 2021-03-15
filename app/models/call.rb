class Call < ApplicationRecord
  paginates_per 10
  belongs_to :user
  belongs_to :client
  belongs_to :screenplay
  has_many :answers, :dependent => :restrict_with_error
  has_many :agreements, :dependent => :restrict_with_error
  has_many :events, :dependent => :restrict_with_error

  def name
    "#{screenplay.name} | #{created_at} | #{user.email}"
  end

  after_create :create_event1
  after_update :create_event2

  def create_event1
    Event.create(name: "Dodano nową rozmowę według scenariusza: #{self.call.screenplay.name}", body: self.inspect, client_id: self.client_id, user_id: self.user_id, call_id: self.id)
  end

  def create_event2
    Event.create(name: 'Zmieniono dane rozmowy', body: self.inspect, client_id: self.client_id, user_id: self.user_id, call_id: self.id)
  end

end
