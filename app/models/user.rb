class User < ApplicationRecord
  has_secure_password

  validates :name, :email, :password, :type, presence: true
  validates :name, uniqueness: true
  validates :password, length: {minimum: 8}

  def instruments_attributes=(instrument_attributes)
    instrument_attributes.values.each do |instrument_attribute|
      return if instrument_attribute[:name].blank?
      instrument = Instrument.find_or_create_by(instrument_attribute)
      self.instrument = instrument
    end
  end
end
