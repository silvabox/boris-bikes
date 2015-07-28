require_relative './bike'

class DockingStation
	attr_reader :capacity

	DEFAULT_CAPACITY = 20

	def initialize(size=DEFAULT_CAPACITY)
		@bikes = []
		@capacity = size
	end

	def dock bike
		fail 'Docking station full' if full?
		@bikes << bike
	end	

	def release_bike
		fail 'No bikes available!' if empty?
	
		if any_working_bikes?
			first_working_bike = @bikes.index { |bike| bike.working? == true }
			@bikes.slice!(first_working_bike)
		else
			fail 'No working bikes available!'
		end

	end
	

	private

	def full?
		@bikes.count >= capacity
	end

	def empty?
		@bikes.empty?
	end

	def any_working_bikes?
		@bikes.any?{ |bike| bike.working? == true }
	end
end