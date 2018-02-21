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
    @activities << Activity.new(activity_name)
  end
end
