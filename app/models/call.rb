class Call < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :screenplay
  has_many :answers, :dependent => :restrict_with_error
  has_many :agreements, :dependent => :restrict_with_error

  def name
    "#{screenplay.name} | #{created_at} | #{user.email}"
  end
end
