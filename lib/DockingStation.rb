require_relative 'Bike'

class DockingStation
  def release_bike
    Bike.new
  end
end


# station = DockingStation.new
# bike = station.release_bike