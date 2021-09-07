class Gig < ApplicationRecord
  belongs_to :music_director
  belongs_to :genre
  has_many :gig_instruments
  has_many :instruments, through: :gig_instruments
  has_many :gig_musicians
  has_many :musicians, through: :gig_musicians
  # accepts_nested_attributes_for :instruments

  def instruments_attributes=(instrument_attributes)
    instrument_attributes.values.each do |instrument_attribute|
      instrument = Instrument.find_or_create_by(instrument_attribute)
      self.instruments << instrument
    end
  end


  def open_instrument_slots
    musician_instruments = self.musicians.map {|musician| musician.instrument_name }
    self.instruments.select {|instrument| !musician_instruments.include?(instrument.name)}
  end

  def self.projects_by_instrument(instrument_id)
    i = Instrument.find_by(id: instrument_id)
    if !i.nil?
      self.all.select {|gig| gig.open_instrument_slots.include?(i)}
    else
      self.all.select {|gig| gig.open_instrument_slots.include?(name: instrument_name)}
    end
  end

  def book_musician(musician)
    if self.budget < musician.pay_rate && self.open_instrument_slots.include?(musician.instrument)
      errors.add(:budget, "is insufficient to pay musician.")
    elsif self.musicians.include?(musician)
      errors.add(:musicians, "#{musician.name} has already been added to #{self.title}'s lineup.")
    elsif !self.open_instrument_slots.include?(musician.instrument)
      errors.add(:instruments, "has already been staffed for this project.")
    else
      self.musicians << musician
      self.update!(budget: (self.budget -= musician.pay_rate))
      "#{musician.name} has been added to #{self.title}!"
    end
  end

  def self.upcoming_gigs
    where("start_date > ?", Date.today).order("start_date DESC")
  end

  def self.already_played
    where("end_date < ?", Date.today).order("start_date DESC")
  end

  def self.in_progress
    # gigs = self.all.select {|gig| gig.start_date <= Date.today && gig.end_date >= Date.today }
    # gigs.order("start_date DESC")
    where(["start_date <= ? AND end_date >= ?", Date.today, Date.today]).order("start_date DESC")
  end
end
