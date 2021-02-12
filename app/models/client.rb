class Client < ApplicationRecord
  paginates_per 10
  has_many :calls
  has_many :reminders
end
