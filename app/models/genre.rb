class Genre < ApplicationRecord
  has_many :gigs
  has_many :music_directors, through: :gigs
  has_many :musicians, through: :gigs
end
