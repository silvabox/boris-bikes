require 'bike'

describe Bike do
	it { is_expected.to respond_to :working? }

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
end