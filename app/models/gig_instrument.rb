class GigInstrument < ApplicationRecord
  belongs_to :instrument
  belongs_to :gig
end
