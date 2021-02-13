class Question < ApplicationRecord
  paginates_per 10
  belongs_to :screenplay
  has_many :answers, :dependent => :restrict_with_error
end
