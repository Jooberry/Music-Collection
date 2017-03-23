require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_accessor :id, :name
  
  def initialize(options)
    @id = options['artist_id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
    VALUES ('#{name}') RETURNING *"
    @id = SqlRunner.run(sql).first()['id'].to_i

  end

  def update()
    sql = "UPDATE artists
      SET name = '#{@name}'
      WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    artists = result.map{|artist| Artist.new(artist)}
    return artists
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    result = SqlRunner.run(sql)
    # (The runner gets back an array of hashes)
    return result.map{|album| Album.new(album)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM artists WHERE artist_id = #{id}"
    result = SqlRunner.run(sql)
    return Artist.new(result.first)
  end

end