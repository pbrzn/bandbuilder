class Musician < User
  belongs_to :instrument
  has_many :gig_musicians
  has_many :gigs, through: :gig_musicians
  has_many :music_directors, through: :gigs
  has_many :genres, through: :gigs
  has_many :auditions

  def instrument_attributes=(attributes)
    return if attributes[:name].blank?
    instrument = Instrument.find_or_create_by(attributes)
    self.instrument = instrument
  end

  def instrument_name
    self.instrument.name
  end

  def self.musicians_by_instrument(instrument)
    self.all.select {|musician| musician.instrument == instrument }
  end
end
