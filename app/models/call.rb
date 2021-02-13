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
end
