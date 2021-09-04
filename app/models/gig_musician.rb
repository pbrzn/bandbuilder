class GigMusician < ApplicationRecord
  belongs_to :gig
  belongs_to :musician
end
