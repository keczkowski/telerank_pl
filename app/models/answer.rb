class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :call
  validates_presence_of :name
end
