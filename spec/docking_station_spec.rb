require 'docking_station'

describe DockingStation do 
	it { is_expected.to respond_to :release_bike }
	
	# it { expect(subject.release_bike).to be_a Bike }

	it "releases a bike and the bike is working" do 
		expect(subject.release_bike).to be_a Bike 
		expect(subject.release_bike.working?).to be true
	end
end