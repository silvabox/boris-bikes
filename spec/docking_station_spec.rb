require 'docking_station'

describe DockingStation do 
	it 'has a default capacity (is set directly in the code)' do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

	it 'should initialize with a capacity of 50 if user inputs 50 as an argument into DockingStation.new' do
		expect(DockingStation.new(50).capacity).to eq(50)
	end
	
	it {is_expected.to respond_to(:dock).with(1).argument}

	describe '#dock' do 
		it 'raises an error when full' do
			subject.capacity.times { subject.dock double :bike }
			expect { subject.dock double :bike }.to raise_error 'Docking station full'
		end
	end

	it {is_expected.to respond_to :release_bike}

	it "releases a Bike after a bike has been docked" do
		subject.dock(Bike.new)
		expect(subject.release_bike).to be_instance_of(Bike)
	end

	it "releases a working bike" do
		bike = double :bike, working?: true 
		subject.dock bike
		expect(subject.release_bike).to be bike
	end

	describe "#release_bike" do
		it "fails if docking station is empty" do
			expect{subject.release_bike}.to raise_error("No bikes available!")
		end

		it 'does not release broken bikes' do 
			subject.dock double :bike, working?: false
			#subject.dock double :bike, working?: false
			expect { subject.release_bike }.to raise_error("No working bikes available!")
		end
	end

	#I want to be able to setup the below test with doubles!

	# context 'when only one broken bike is docked' do 
	# 	bike = Bike.new
	# 	bike.report_broken
	# 	station = DockingStation.new
	# 	station.dock bike

	# 	describe "#release_bike" do
	# 		it 'fails and raises an exception' do 
	# 		expect{ station.release_bike }.to raise_error("No working bikes available!")
	# 		end
	# 	end
	# end

	context 'when a mixture of working bikes and broken bikes are docked' do 
		station = DockingStation.new

		i = 1
		until i == 3 do 
			station.dock Bike.new

			bike = Bike.new
			bike.report_broken
			station.dock bike
			i += 1
		end

		describe "#release_bike" do
			it 'releases all working bikes first but then will not release anymore bikes' do 
				expect(station.release_bike).to be_working
				expect(station.release_bike).to be_working
				expect{station.release_bike}.to raise_error("No working bikes available!")
			end
		end
	end

end