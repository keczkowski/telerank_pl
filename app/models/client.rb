class Client < ApplicationRecord
  paginates_per 10
  has_many :calls, :dependent => :restrict_with_error
  has_many :reminders, :dependent => :restrict_with_error
  has_many :agreements, :dependent => :restrict_with_error
  has_many :events, :dependent => :restrict_with_error

  def name
    "#{imie} #{nazwisko}"
  end

end
