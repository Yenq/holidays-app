require 'spec_helper'

describe Holidays::App do
	let(:cli) { Holidays::Cli.new([], StringIO.new("user input"), StringIO.new)}
	let(:app) { Holidays::App.new(cli)}

	context ".new" do
		subject { app }

		it do
			expect(app.instance_variable_get(:@cli)).to eq cli
			expect(app.stdout).to eq cli.stdout
			expect(app.stdin).to eq cli.stdin
			expect(app.params).to eq cli.argv
		end
	end

	context "attach commands" do
		subject { app.instance_variable_get(:@commands) }

		it do
			expect(subject.size).to eq 4
			expect(subject[:new]).to be_a Holidays::Command::New
			expect(subject[:list]).to be_a Holidays::Command::List
			expect(subject[:view]).to be_a Holidays::Command::View
			expect(subject[:continue]).to be_a Holidays::Command::Continue
		end
	end

	context ".read_line" do
		subject do
			app.read_line
		end

		it { expect(subject).to eq "user input" }
	end

	context ".write_line" do
		subject do
			app.write_line("test line")
			cli.stdout.string
		end
		it { expect(subject).to eq "test line\n" }
	end

	context "unexpected command" do
    	subject { app.run(:unexpected_command) }

    	it { expect { subject }.to raise_error "Command <unexpected_command> not found" }
  	end
end
