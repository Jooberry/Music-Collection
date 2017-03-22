require('pry')
require_relative('models/album')
require_relative('models/artist')

artist1 = Artist.new({'name' => 'Allegretto'})
artist1.save()

artist2 = Artist.new({'name' => 'Zsoltina'})
artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Dank',
  'genre' => 'classical'
  })
album1.save()

album2 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Spank',
  'genre' => 'drum n bass'
  })
album2.save()

album3 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Squirrel Story',
  'genre' => 'house'
  })
album3.save()

album4 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'Me and my beard',
  'genre' => 'nu jazz'
  })
album4.save()

album5 = Album.new({
  'artist_id' => artist2.id,
  'title' => 'How to blow your own hunting horn',
  'genre' => 'garage'
  })
album5.save()

binding.pry
nil