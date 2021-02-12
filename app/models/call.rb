class Call < ApplicationRecord
  belongs_to :user
  belongs_to :client
  belongs_to :screenplay
  has_many :answers
end
