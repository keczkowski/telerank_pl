class Screenplay < ApplicationRecord
  paginates_per 10
  belongs_to :partner
  has_many :questions, :dependent => :restrict_with_error
  has_many :calls, :dependent => :restrict_with_error
end
