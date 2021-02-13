class Event < ApplicationRecord
  paginates_per 10
  belongs_to :user
  belongs_to :client
  belongs_to :call, optional: true
  belongs_to :agreement, optional: true
  belongs_to :reminder, optional: true

  validates_presence_of :name
  validates_presence_of :body
end
