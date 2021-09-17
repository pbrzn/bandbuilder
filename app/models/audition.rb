class Audition < ApplicationRecord
  belongs_to :gig
  belongs_to :musician
  has_one :music_director, through: :gig

end
