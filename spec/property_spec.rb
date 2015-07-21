require 'spec_helper'

describe Holidays::Model::Property do
	context ".generate_id" do
		subject { Holidays::Model::Property.generate_id }
		it { expect(subject.size).to eq 8 }
	end
end
