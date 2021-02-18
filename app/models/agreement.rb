class Agreement < ApplicationRecord
  paginates_per 10

  belongs_to :client
  belongs_to :user
  belongs_to :partner
  belongs_to :call

  validates_presence_of :name
  validates_presence_of :body

  after_create :create_event1
  after_update :create_event2

  def create_event1
    Event.create(name: 'Dodano nową umowę', body: self.inspect, client_id: self.client_id, user_id: self.user_id, agreement_id: self.id)
  end

  def create_event2
    Event.create(name: 'Zmieniono dane umowy', body: self.inspect, client_id: self.client_id, user_id: self.user_id, agreement_id: self.id)
  end

end
