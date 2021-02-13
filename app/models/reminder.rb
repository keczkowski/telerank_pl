class Reminder < ApplicationRecord
  paginates_per 10
  belongs_to :user
  belongs_to :client
  has_many :agreements, :dependent => :restrict_with_error

  validates_presence_of :name
  validates_presence_of :remind_at
end
