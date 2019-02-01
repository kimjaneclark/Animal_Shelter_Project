require_relative( '../db/sql_runner' )
require_relative('./owner.rb')


class Animal

  attr_reader :id
  attr_accessor :name, :type, :entry_date, :status, :owner_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @entry_date = options['entry_date']
    @status = options['status']
    @owner_id = options['owner_id']
  end


  def save()
    sql = "INSERT INTO animals
    (
      name,
      type,
      entry_date,
      status,
      owner_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING *"
    values = [@name, @type, @entry_date, @status, @owner_id]
    animal = SqlRunner.run( sql, values ).first
    @id = animal['id'].to_i
  end

  def self.delete_all()
      sql = "DELETE FROM animals"
      SqlRunner.run(sql)
    end


  def self.all()
    sql = "SELECT * FROM animals"
    animals = SqlRunner.run(sql)
    result = animals.map { |animal| Animal.new( animal ) }
    return result
  end

  def update()
    sql = "UPDATE animals
    SET
    (
      name,
      type,
      entry_date,
      status,
      owner_id
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@name, @type, @entry_date, @status, @owner_id, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
  sql = "DELETE FROM animals
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end

def self.find(type)
    sql = "SELECT * FROM animals WHERE type = $1"
    values = [type]
    animal = SqlRunner.run( sql, values )
    result = Animal.new( animal.first )
    return result
  end

  def self.available()
      sql = "SELECT * FROM animals WHERE status = $1 AND owner_id IS NULL"
      values = ["Available"]
      animals = SqlRunner.run( sql, values)
      result = animals.map { |animal| Animal.new( animal ) }
      return result
    end

  def available_for_adoption()
      sql = "UPDATE animals
      SET status = 'Available'
      WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
    end

    def adopted(owner)
      sql = "UPDATE animals SET
      (status, owner_id)
      = ('Unavailable', $1)
      WHERE id = $2"
      values = [owners.id, @id]
      SqlRunner.run(sql, values)
    end

  end