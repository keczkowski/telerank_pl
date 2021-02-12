class Question < ApplicationRecord
  belongs_to :screenplay
  has_many :answers, :dependent => :restrict_with_error
end
