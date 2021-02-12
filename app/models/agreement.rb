class Agreement < ApplicationRecord
  paginates_per 10

  belongs_to :client
  belongs_to :user
  belongs_to :partner
  belongs_to :call

  validates_presence_of :name
  validates_presence_of :body

end
