require 'docking_station'

describe DockingStation do 
	it 'has a default capacity (is set directly in the code)' do
		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	end

	it 'should initialize with a capacity of 50 if user inputs 50 as an argument into DockingStation.new' do
		expect(DockingStation.new(50).capacity).to eq(50)
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
		it "fails if no bikes available" do
			expect{subject.release_bike}.to raise_error("No bikes available!")
		end
	end

	it {is_expected.to respond_to(:dock).with(1).argument}

	describe '#dock' do 
		it 'raises an error when full' do
			subject.capacity.times { subject.dock Bike.new }
			expect { subject.dock Bike.new }.to raise_error 'Docking station full'
		end
	end	

end