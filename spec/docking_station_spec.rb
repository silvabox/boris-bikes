require_relative '../lib/DockingStation'

describe DockingStation do

  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'gets a bike' do
    bike = subject.release_bike
    expect(bike).to be_instance_of(Bike)
  end

  it 'expects the bike to be working' do
    bike = subject.release_bike
    expect(bike).to be_working

    #expect(bike.working?).to eq true
  end

end
