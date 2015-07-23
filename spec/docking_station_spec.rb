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
			subject.capacity.times { subject.dock Bike.new }
			expect { subject.dock Bike.new }.to raise_error 'Docking station full'
		end
	end
	
	it {is_expected.to respond_to :release_bike}

	it "releases a Bike after a bike has been docked" do
		subject.dock(Bike.new)
		expect(subject.release_bike).to be_instance_of(Bike)
	end

	it "releases a working bike" do 
		subject.dock(Bike.new)
		expect(subject.release_bike).to be_working
	end

	describe "#release_bike" do
		it "fails if docking station is empty" do
			expect{subject.release_bike}.to raise_error("No bikes available!")
		end
	end

	context 'only one broken bike is docked' do 
		bike = Bike.new
		bike.report_broken
		station = DockingStation.new
		station.dock bike

		describe "#release_bike" do
			it 'fails and raises an exception' do 
			expect{ station.release_bike }.to raise_error("No working bikes available!")
			end
		end
	end

	# context 'one broken bike and one working bike are docked' do
	# 	station = DockingStation.new
	# 	working_bike = Bike.new
	# 	station.dock working_bike
	# 	broken_bike = Bike.new
	# 	broken_bike.report_broken
	# 	station.dock broken_bike

	# 	it 'releases the working bike and then will not release the broken bike' do 
	# 		expect(station.release_bike).to eq(working_bike)
	# 		expect{station.release_bike}.to raise_error("No working bikes available!")
	# 	end
	# end

	context 'a mixture of working bikes and broken bikes are docked' do 
		station = DockingStation.new
		working_bike1 = Bike.new
		working_bike2 = Bike.new
		broken_bike1 = Bike.new
		broken_bike1.report_broken
		broken_bike2 = Bike.new
		broken_bike2.report_broken
		station.dock working_bike1 
		station.dock broken_bike1
		station.dock working_bike2 
		station.dock broken_bike2

		it 'releases all working bikes first but then will not release anymore bikes' do 
			expect(station.release_bike).to be_working
			expect(station.release_bike).to be_working
			expect{station.release_bike}.to raise_error("No working bikes available!")
		end
	end

end