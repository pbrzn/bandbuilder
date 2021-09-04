# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MusicDirector.create(name: "John Jacob", email: "example_one@mail.com", password: "passw0rd...")
MusicDirector.create(name: "Jingle H. Schmidt", email: "example_two@mail.com", password: "p@sswerd1")
MusicDirector.create(name: "His Name", email: "example_three@mail.com", password: "¡pa55word!")
MusicDirector.create(name: "Is My", email: "example_four@mail.com", password: "p@ss_w0rd")
MusicDirector.create(name: "Name Too", email: "example_five@mail.com", password: "Pass--W0rd")

Instrument.create(name: "Acoustic Guitar")
Instrument.create(name: "Electric Guitar")
Instrument.create(name: "Electric Bass")
Instrument.create(name: "Piano")
Instrument.create(name: "Drums")
Instrument.create(name: "Keyboards")
Instrument.create(name: "Vocals")
Instrument.create(name: "Alto Sax")
Instrument.create(name: "Tenor Sax")
Instrument.create(name: "Trumpet")
Instrument.create(name: "Violin")
Instrument.create(name: "Cello")
Instrument.create(name: "Upright Bass")

Genre.create(name: "Rock")
Genre.create(name: "Pop")
Genre.create(name: "Jazz")
Genre.create(name: "Classical")
Genre.create(name: "Hip-Hop/Rap")
Genre.create(name: "Folk")
Genre.create(name: "Country")
Genre.create(name: "Broadway")

Musican.create(name: "Jimi Hendrix", email: "example_six@mail.com", password: "pass.w0000rd", instrument_id: 2, pay_rate: 250.25)
Musican.create(name: "Freddie Mercury", email: "example_seven@mail.com", password: "!-0πåßß∑ø®", instrument_id: 7, pay_rate: 250.25)
Musican.create(name: "Charlie Parker", email: "example_eight@mail.com", password: "-pa##w6rd-", instrument_id: 8, pay_rate: 250.25)
Musican.create(name: "John Coltrane", email: "example_nine@mail.com", password: "p@st_word5", instrument_id: 9, pay_rate: 250.25)
Musican.create(name: "Miles Davis", email: "example_ten@mail.com", password: "dr0wss@p", instrument_id: 10, pay_rate: 250.25)
Musican.create(name: "Keith Moon", email: "example_eleven@mail.com", password: "dr@wss0p", instrument_id: 5, pay_rate: 250.25)
Musican.create(name: "Stanley Clarke", email: "example_twelve@mail.com", password: "dp@5r05w", instrument_id: 3, pay_rate: 250.25)
Musican.create(name: "Chick Corea", email: "example_thirteen@mail.com", password: "@w5P0dR5", instrument_id: 4, pay_rate: 250.25)
Musican.create(name: "Hans Zimmer", email: "example_fourteen@mail.com", password: "P&ss558rd", instrument_id: 6, pay_rate: 250.25)
Musican.create(name: "Charles Mingus", email: "example_fifteen@mail.com", password: "P@55inw0rds", instrument_id: 13, pay_rate: 250.25)
Musican.create(name: "Yo Yo Ma", email: "example_fifteen@mail.com", password: "W0RdsTh@tP@ss", instrument_id: 12, pay_rate: 250.25)
Musican.create(name: "Niccolo Paganinni", email: "example_fifteen@mail.com", password: "wurdswurdsW@RD5", instrument_id: 11, pay_rate: 250.25)
Musican.create(name: "Django Reinhart", email: "example_fifteen@mail.com", password: "W@RD5W@RD5W@RD5", instrument_id: 1, pay_rate: 250.25)

Gig.create(music_director_id: 1, genre_id: 1, title: "Jazz Combo @ The Village Underground", location: "The Village Underground – New York, NY", start_date: )
