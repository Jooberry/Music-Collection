require('pg')
require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_writer :title, :genre
  attr_reader :id, :artist_id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (
    title,
    genre,
    artist_id
    ) VALUES (
    '#{@title}',
    '#{@genre}',
    #{@artist_id}) RETURNING *"
    @id = SqlRunner.run(sql).first()['id'].to_i
  end

    def delete()
      sql = "DELETE FROM albums WHERE id = #{@id}"
      SqlRunner.run(sql)
    end

    def update()
      sql = "UPDATE albums 
        SET (
        title, 
        genre,
        artist_id) = ( 
        '#{@title}', 
        #{@genre}),
        #{@artist_id}
        WHERE id = #{@id}"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM albums"
      result = SqlRunner.run(sql)
      return result.map{|album| Album.new(album)}
    end

    def self.delete_all()
      sql = "DELETE FROM albums"
      SqlRunner.run(sql)
    end

    def artist()
      sql = "SELECT * FROM artists WHERE artist_id = #{@artist_id}"
      result = SqlRunner.run(sql)
      return result.map{|artist| Artist.new(artist)}
    end

    def self.find_by_id(id)
      sql = "SELECT * FROM albums WHERE id = #{id}"
      result = SqlRunner.run(sql)
      return result.map{|album|Album.new(album)}.first()
    end

end