class Call < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :screenplay
  has_many :answers
  has_many :agreements

  def name
    "#{screenplay.name} | #{created_at} | #{user.email}"
  end
end
