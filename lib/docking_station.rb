require_relative './bike'

class DockingStation
	attr_reader :capacity

	DEFAULT_CAPACITY = 20

	def initialize(size=DEFAULT_CAPACITY)
		@bikes = []
		@capacity = size
	end

	def release_bike
		fail "No bikes available!" if empty?

		i = 0
		@bikes.each do |bike|
		 	if bike.working?
		 		@bikes.delete_at(i)
		 		return bike
		 	else
		 		fail "No working bikes available!"
		 	end
			i += 1
		end
	end	

	def dock bike
		fail 'Docking station full' if full?
		@bikes << bike
	end	

	private

		attr_reader :bikes

	def full?
		@bikes.count >= capacity
	end

	def empty?
		@bikes.empty?
	end
end