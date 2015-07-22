require 'docking_station'

describe DockingStation do 
	it { is_expected.to respond_to :release_bike }
	
	# it { expect(subject.release_bike).to be_a Bike }

	it "releases a bike" do 
		expect(subject.release_bike).to be_a Bike 
	end

	it "releases a bike that is working" do
		bike = subject.release_bike
		expect(bike).to be_working
	end

	# it "responds to the method .dock" do
	# 	expect(subject).to respond_to(:dock).with(1).argument
	# end

	# describe "#release_bike" do
	# 	it 'raises an error when there are no bikes available' do
	# 		expect{subject.release_bike}.to raise_error 'No Bikes Available'
	# 	end
	# end
end