require_relative '../lib/Bike'

describe Bike do

  # it "responds to the method 'working?'" do
  #   expect(subject).to respond_to :working?
  # end
    it { is_expected.to respond_to :working?}

end