require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_create_instance_of_activity
    hiking = Activity.new
    assert_instance_of Activity, hiking
  end

  def test_activity_has_a_participant
    hiking = Activity.new
    hiking.add_participant({ name: 'Bob', paid: 20.00 })
    assert_equal ['Bob'], hiking.participants
  end

  def test_add_multiple_participants
    hiking = Activity.new
    hiking.add_participant({ name: 'Odin', paid: 20.00 })
    hiking.add_participant({ name: 'Thor', paid: 20.00 })
    hiking.add_participant({ name: 'Bob', paid: 20.00 })
    assert_equal ['Odin', 'Thor', 'Bob'], hiking.participants
  end

  def test_total_cost_one_participant
    hiking = Activity.new
    hiking.add_participant({ name: 'Bob', paid: 20.00 })

    assert_equal 20.00, hiking.total_cost
  end

  def test_total_cost_multiple_participants
    hiking = Activity.new
    hiking.add_participant({ name: 'Odin', paid: 20.00 })
    hiking.add_participant({ name: 'Thor', paid: 30.00 })
    hiking.add_participant({ name: 'Bob', paid: 10.00 })
    assert_equal 60, hiking.total_cost
  end
end
