require 'minitest/autorun'
require_relative '../animal'

class TestAnimal < Minitest::Test

  def setup
    options = {"id" => 1, "name" => "Stimpy", "type" => "Dog", "entry_date" => "2018-12-01", "status" => "Unavailable", "owner_id" => 1}

    @animal = Animal.new(options)
  end


  def test_animal_has_name
    assert_equal("Stimpy", @animal.name)
  end

  def test_animal_has_id
    assert_equal(1, @animal.id)
  end

  def test_animal_has_type
    assert_equal("Dog", @animal.type)
  end

  def test_animal_has_entry_date
    assert_equal("2018-12-01", @animal.entry_date)
  end

  def test_animal_has_status
    assert_equal("Unavailable", @animal.status)
  end

  def test_animal_has_owner
    assert_equal(1, @animal.owner_id)
  end

end
