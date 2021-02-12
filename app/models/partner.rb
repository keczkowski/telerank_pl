class Partner < ApplicationRecord
  paginates_per 10
  has_many :screenplays, :dependent => :restrict_with_error
  has_many :agreements, :dependent => :restrict_with_error
end
