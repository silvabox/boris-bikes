require 'docking_station'

describe DockingStation do 
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
			20.times { subject.dock Bike.new }
			expect { subject.dock Bike.new }.to raise_error 'Docking station full'
		end
	end	

end