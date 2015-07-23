require 'bike'

describe Bike do
	it { is_expected.to respond_to :working? }
	it { is_expected.to respond_to :report_broken }

	it 'is created as a working bike by default' do
		expect(subject).to be_working
	end

	describe '#working' do 
		it 'returns false when bike is broken' do
			subject.report_broken
			expect(subject).to_not be_working
		end
	end

	it 'can be reported broken' do 
		subject.report_broken
		expect(subject).to be_broken
	end

	it 'is not working after being reported broken' do
		subject.report_broken
		expect(subject).to_not be_working
	end
end