require 'docking_station'

describe DockingStation do 
	it {is_expected.to respond_to :release_bike}

	it "releases a Bike" do
		expect(subject.release_bike).to be_instance_of(Bike)
	end

	it "fails if no bikes available" do
		expect{subject.release_bike}.to raise_error("No bikes available!")
	end

	it {is_expected.to respond_to(:dock).with(1).argument}

end