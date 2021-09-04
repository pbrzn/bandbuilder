class MusicDirector < User
  has_many :gigs
  has_many :musicians, through: :gigs
  has_many :genres, through: :gigs

end
