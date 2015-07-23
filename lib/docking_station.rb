require_relative './bike'

class DockingStation
	attr_reader :capacity

	DEFAULT_CAPACITY = 20

	def initialize(size=DEFAULT_CAPACITY)
		@bikes = []
		@capacity = size
	end

	def release_bike
		fail 'No bikes available!' if empty?
	
		if @bikes.any?{ |bike| bike.working? == true }
			position = @bikes.index { |o| o.working? == true }
			@bikes.slice!(position)
		else
			fail 'No working bikes available!'
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