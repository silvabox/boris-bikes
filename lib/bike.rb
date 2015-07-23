class Bike

	def initialize
		@working = true
	end

	def working?
		@working
	end

	def report_broken
		@working = nil
	end

	def broken? 
		if @working == true
			return false
		else
			return true
		end
	end

end