# Creates an activity instance
class Activity
  attr_reader :participants
  def initialize
    @participants = []
    @cost_array = []
  end

  def add_participant(participant)
    @participants << participant[:name]
    @cost_array << participant[:paid]
  end

  def total_cost
    @cost_array.inject(0, :+)
  end
end
