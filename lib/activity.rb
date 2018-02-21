# Creates an activity instance
class Activity
  attr_reader :participants
  def initialize
    @participants = []
    @cost_array = []
    @participant_array = []
  end

  def add_participant(participant)
    @participants << participant[:name]
    @cost_array << participant[:paid]
    @participant_array << participant
  end

  def total_cost
    @cost_array.inject(0, :+)
  end

  def split_cost
    total_cost / @participants.count
  end

  def cost_difference(name_given)
    @participant_array.map do |participant|
      return split_cost - participant[:paid] if participant[:name] == name_given
    end
  end
end
