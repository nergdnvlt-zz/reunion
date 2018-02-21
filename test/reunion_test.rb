require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_exists
    reunion = Reunion.new

    assert_instance_of Reunion, reunion
  end

  def test_it_has_default_location
    reunion = Reunion.new

    assert_equal 'High School', reunion.location
  end

  def test_it_takes_location
    reunion = Reunion.new('Bowling Alley')

    assert_equal 'Bowling Alley', reunion.location
  end

  def test_default_has_no_activities
    reunion = Reunion.new

    assert_equal [], reunion.activities
  end

  def test_add_new_activity
    reunion = Reunion.new('Bowling Alley')
    reunion.add_activity('Bowling')
    result = reunion.activities
    assert_equal 1, result.count
  end

  def test_add_multiple_activities
    reunion = Reunion.new('Park')
    reunion.add_activity('Volleyball')
    result = reunion.activities
    assert_equal 1, result.count

    result2 = reunion.add_activity('Flag football')
    assert_equal 2, result2.count
  end
end
