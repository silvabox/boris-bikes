require 'docking_station'

describe DockingStation do 

	let(:working_bike){ double :working_bike, working?: true }
	let(:broken_bike){ double :broken_bike, working?: false }

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

	context "when a bike is docked" do
		before do
			subject.dock working_bike
		end

		it "releases a working bike" do
			expect(subject.release_bike).to be working_bike
		end
	end

	describe "#release_bike" do
		it "fails if docking station is empty" do
			expect{subject.release_bike}.to raise_error("No bikes available!")
		end

		it 'does not release broken bikes' do 
			subject.dock broken_bike
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

		it 'releases all working bikes first but then will not release anymore bikes' do 
			expect(station.release_bike).to be_working
			expect(station.release_bike).to be_working
			expect{station.release_bike}.to raise_error("No working bikes available!")
		end
	end

end