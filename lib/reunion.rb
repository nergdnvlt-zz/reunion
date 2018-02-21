require './lib/activity'
# Creates a reunion instance
class Reunion
  attr_reader :location,
              :activities

  def initialize(location = 'High School', activities = [])
    @location = location
    @activities = activities
  end

  def add_activity(activity_name)
    require "pry"; binding.pry
    activity = Activity.new(activity_name)
    @activities << activity
    require "pry"; binding.pry
  end
end
