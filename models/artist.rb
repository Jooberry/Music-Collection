require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Artist

  attr_reader :id, :name
  
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
    VALUES ('#{name}') RETURNING *"
    @id = SqlRunner.run(sql).first()['id'].to_i
  end

end