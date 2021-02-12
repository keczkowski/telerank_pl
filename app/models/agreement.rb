class Agreement < ApplicationRecord
  belongs_to :client
  belongs_to :user
  belongs_to :partner
  belongs_to :call
  validates_presence_of :name

end
