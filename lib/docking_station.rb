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

		fail 'No working bikes available!' if @bikes.all? { |b| b.broken? == true }
	
		if @bikes.any?{ |bike| bike.working? == true }
			position = @bikes.index { |o| o.working? == true }
			@bikes.slice!(position)
		else
			fail 'No working bikes available!'
		end

		# fail 'No bikes available!' if empty?

		# count = @bikes.count

		# i = 0

		# until i == count do
		# 	fail 'No working bikes available!' if @bikes.all? {|b| b.broken?}
		# 	if (@bikes[i]).working?
		# 		@bikes.delete_at(i)
		# 	end

		# 	i += 1
		# end

		# @bikes.each do |bike|
		# 	if bike.working?
		# 		@bikes.delete(bike)
		# 		return bike
		# 	end
		# end

		# i = 0
		# @bikes.each do |bike|
		# 	if @bikes.all? { |b| b.broken? }
		# 		fail 'No working bikes available!'
		# 	end

		#  	if bike.working?
		#  		@bikes.delete_at(i)
		#  		return bike
		#  	else
		#  		i += 1
		#  	end
		# end
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