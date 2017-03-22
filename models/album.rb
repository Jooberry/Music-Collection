require('pg')
require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_writer :title, :genre
  attr_reader :id, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre'].to_i
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO music_collection (
    title,
    genre,
    artist_id
    ) VALUES (
    '#{@title}',
    '#{genre}',
    #{artist_id}) RETURNING id;"
    @id = SqlRunner.run(sql).first()['id'].to_i
  end

end