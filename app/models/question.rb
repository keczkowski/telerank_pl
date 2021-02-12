class Question < ApplicationRecord
  belongs_to :screenplay
  has_many :answers
end
