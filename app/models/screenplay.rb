class Screenplay < ApplicationRecord
  paginates_per 10
  belongs_to :partner
  has_many :questions, :dependent => :restrict_with_error
  has_many :calls, :dependent => :restrict_with_error

  validates_presence_of :name
  validates_presence_of :body
  validates_presence_of :prelude
  validates_presence_of :ending

end
