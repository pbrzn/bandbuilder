class Gig < ApplicationRecord
  belongs_to :music_director
  belongs_to :genre
  has_many :gig_instruments
  has_many :instruments, through: :gig_instruments
  has_many :gig_musicians
  has_many :musicians, through: :gig_musicians
  has_many :auditions

  validates :title, :genre, :instruments, :start_date, :end_date, :budget, presence: true

  scope :upcoming_gigs, -> { where("start_date > ?", Date.today).order("start_date DESC") }
  scope :already_played, -> { where("end_date < ?", Date.today).order("start_date DESC") }
  scope :in_progress, -> { where(["start_date <= ? AND end_date >= ?", Date.today, Date.today]).order("start_date DESC") }

  def instruments_attributes=(instrument_attributes)
    instrument_attributes.values.each do |instrument_attribute|
      return if instrument_attribute[:name].blank?
      instrument = Instrument.find_or_create_by(instrument_attribute)
      self.instruments << instrument
    end
  end


  def open_instrument_slots
    musician_instruments = self.musicians.map {|musician| musician.instrument_name }
    self.instruments.select {|instrument| !musician_instruments.include?(instrument.name)}
  end

  def self.open_projects_by_instrument(instrument_name)
    i = Instrument.find_by(name: instrument_name)
    self.all.select {|gig| gig.open_instrument_slots.include?(name: instrument_name)}
  end

  def book_musician(musician)
    if self.budget < musician.pay_rate && self.open_instrument_slots.include?(musician.instrument)
      errors.add(:budget, "is insufficient to pay musician.")
    elsif self.musicians.include?(musician)
      errors.add(:musicians, "#{musician.name} has already been added to #{self.title}'s lineup.")
    elsif !self.open_instrument_slots.include?(musician.instrument)
      errors.add(:instruments, "#{musician.instrument_name} has already been staffed for this project.")
    else
      self.musicians << musician
      if self.auditions.any? {|a| a.musician == musician}
        self.auditions.find {|a| a.musician == musician}.destroy
      end
      self.update(budget: (self.budget -= musician.pay_rate))
    end
  end
end
