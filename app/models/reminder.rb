class Reminder < ApplicationRecord
  belongs_to :user
  belongs_to :client
  validates_presence_of :name
  validates_presence_of :remind_at
end
