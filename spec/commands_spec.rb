require 'spec_helper'

describe "Holidays::Command::*" do
	let(:stdin1) { File.open(File.join(File.dirname(__FILE__), "examples", "example1.txt")) }
  	let(:cli) { Holidays::Cli.new([], stdin1, StringIO.new)}
	let(:app) { Holidays::App.new(cli)}

	describe Holidays::Command::List do
		let(:command) { Holidays::Command::List.new(app) }

		context "Collection Is Empty" do
			subject do
				command.do
				cli.stdout.string
			end

			it { expect(subject).to include ("No offers found.") }
		end

		context "Collection Isn't Empty" do
			before { FactoryGirl.create(:property) }
			subject do
				command.do
				cli.stdout.string
			end
			it { expect(subject).to include ("Found 1 offer") }
		end
	end

	describe Holidays::Command::New do
		let(:command) { Holidays::Command::New.new(app) }
		subject do
			command.do
			cli.stdout.string
		end

		it { expect(subject).to include "Starting with new property" }
	end
end
