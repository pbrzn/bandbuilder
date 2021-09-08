class Musician < User
  belongs_to :instrument
  has_many :gig_musicians
  has_many :gigs, through: :gig_musicians
  has_many :music_directors, through: :gig
  has_many :genres, through: :gig

  def instrument_name
    self.instrument.name
  end

  def self.musicians_by_instrument(instrument)
    self.all.select {|musician| musician.instrument == instrument }
  end
end
