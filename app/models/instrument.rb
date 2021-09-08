class Instrument < ApplicationRecord
  has_many :musicians
  has_many :gig_instruments
  has_many :gigs, through: :gig_instruments

  validates :name, presence: true

end
