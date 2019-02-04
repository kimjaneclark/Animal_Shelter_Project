require_relative( '../db/sql_runner' )
require_relative('./animal.rb')


class Owner

  attr_reader :id
  attr_accessor :name, :address, :contact_num

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @contact_num = options['contact_num']
  end



def save()
  sql = "INSERT INTO owners
  (
    name,
    address,
    contact_num
  )
  VALUES
  (
    $1, $2, $3
  )
  RETURNING *"
  values = [@name, @address, @contact_num]
  owner = SqlRunner.run( sql, values ).first
  @id = owner['id'].to_i
end

def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    owners = SqlRunner.run(sql)
    result = owners.map { |owner| Owner.new( owner ) }
    return result
  end

  def update()
    sql = "UPDATE owners
    SET
    (
      name,
      address,
      contact_num
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @address, @contact_num, @id]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def animals()
    sql = "SELECT name FROM animals WHERE owner_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    animals = results.map {|animal| Animal.new(animal)}
  return animals
end

  def self.find(id)
      sql = "SELECT * FROM owners WHERE id = $1"
      values = [id]
      owner = SqlRunner.run( sql, values )
      result = Owner.new( owner.first )
      return result
  end

  end
