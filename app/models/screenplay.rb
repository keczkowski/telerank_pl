class Screenplay < ApplicationRecord
  paginates_per 10
  belongs_to :partner
  has_many :questions
  has_many :calls
end
