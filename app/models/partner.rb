class Partner < ApplicationRecord
  paginates_per 10
  has_many :screenplays
end
