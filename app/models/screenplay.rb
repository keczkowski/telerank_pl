class Screenplay < ApplicationRecord
  paginates_per 10
  belongs_to :partner
  has_many :questions
end
