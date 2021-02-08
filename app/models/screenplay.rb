class Screenplay < ApplicationRecord
  paginates_per 10
  belongs_to :partner
end
