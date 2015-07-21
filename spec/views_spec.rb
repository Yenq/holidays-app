require 'spec_helper'

describe "Holidays::Views::*" do
	let(:cli) { Holidays::Cli.new([], $stdin, $stdout)}
	let(:app) { Holidays::App.new(cli)}

	before do
		$stdin = StringIO.new
		$stdout = StringIO.new
	end

	describe Holidays::Views::Static do
		let(:view) { Holidays::Views::Static.new(app, nil)}
		context ".assign" do
			subject do
				view.assign(record: { key1: "value1", key2: "value2"})
				view.data_record
			end

			it do
				expect(subject).to be_a Hash
				expect(subject[:key1]).to eq "value1"
				expect(subject[:key2]).to eq "value2"
			end
		end

		context ".ui" do
			subject { view.send(:ui, 'ui.list.collection.message-empty')}
			it { expect(subject).to eq "No offers found." }
		end

		context ".fields" do
			subject { view.send(:fields) }
			it { expect(subject).to be_a Hash }
		end

		context ".field (w/o value)" do
			subject do
				view.send(:field, :title, "")
				cli.stdout.string
			end

			it { expect(subject).to eq "Title: \n" }
		end

		context ".field (w value)" do
			subject do
				view.send(:field, :property_type, 1)
				cli.stdout.string
			end

			it { expect(subject).to eq "Property Type: Apartment\n" }
		end

		context ".w (w/o params)" do
			subject do
				view.send(:w, "test line")
				cli.stdout.string
			end
			it { expect(subject).to eq "test line\n"}
		end

		context ".w (w params)" do
			subject do
				view.send(:w, "replace :to1 with :to2", { to1: "A", to2: "B"})
				cli.stdout.string
			end

			it { expect(subject).to eq "replace A with B\n"}
		end

		context ".error" do
			subject do
				view.send(:error, :default)
			end

			it { expect(subject).to eq "Error: please input correct value" }
		end
	end

	describe Holidays::Views::Interactive do
		let(:view) { Holidays::Views::Interactive.new(app, nil)}

		context ".r" do
			before do
				$stdin = StringIO.new("user imput")
			end

			subject do
				view.send(:r, :address, "Address")
				cli.stdout.string
			end

			it { expect(subject).to eq "Address:\n" }
		end

		context ".r (w RegExp)" do
			before do
				$stdin = StringIO.new("2")
			end

			subject do
				view.send(:r, :guests, "Max Guests")
				cli.stdout.string
			end

			it { expect(subject).to eq "Max Guests:\n" }
		end

	end
end
