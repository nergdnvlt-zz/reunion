require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @hiking = Activity.new('Hiking')
    @hiking.add_participant({ name: 'Odin', paid: 20.00 })
    @hiking.add_participant({ name: 'Thor', paid: 30.00 })
    @hiking.add_participant({ name: 'Bob', paid: 10.00 })
  end

  def test_create_instance_of_activity
    assert_instance_of Activity, @hiking
  end

  def test_activity_has_description
    assert_equal 'Hiking', @hiking.description
  end

  def test_activity_has_default_description
    activity = Activity.new
    assert_equal 'Hanging out', activity.description
  end

  def test_pass_participant_as_argument
    bowling = Activity.new('Bowling', ({ name: 'Bob', paid: 10.00 }))

    assert_equal ['Bob'], bowling.participants
    assert_equal 10.00, bowling.total_cost
  end

  def test_activity_has_a_participant
    hiking = Activity.new
    hiking.add_participant({ name: 'Bob', paid: 20.00 })

    assert_equal ['Bob'], hiking.participants
  end

  def test_add_multiple_participants
    assert_equal ['Odin', 'Thor', 'Bob'], @hiking.participants
  end

  def test_total_cost_one_participant
    hiking = Activity.new
    hiking.add_participant({ name: 'Bob', paid: 20.00 })

    assert_equal 20.00, hiking.total_cost
  end

  def test_total_cost_multiple_participants
    assert_equal 60, @hiking.total_cost
  end

  def test_split_cost
    assert_equal 20.00, @hiking.split_cost
  end

  def test_cost_difference
    result = @hiking.cost_difference('Bob')
    assert_equal 10.0, result
  end

  def test_cost_difference_all
    result = @hiking.cost_difference('Bob')
    assert_equal 10.0, result
    result2 = @hiking.cost_difference('Odin')
    assert_equal 0.0, result2
    result3 = @hiking.cost_difference('Thor')
    assert_equal (-10.0), result3
  end
end
