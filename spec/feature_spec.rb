require "spec_helper"

describe Holidays::Cli do
  let(:stdin1) { File.open(File.join(File.dirname(__FILE__), "examples", "example1.txt")) }
  let(:stdin2) { File.open(File.join(File.dirname(__FILE__), "examples", "example2.txt")) }

  context "new" do
    let(:cli) { Holidays::Cli.new(["new"], stdin1, StringIO.new) }

    subject do
        cli.execute!
        cli.stdout.string
    end

    it "allows for entering data" do
      expect(subject).to include "Starting with new property"
      expect(subject).to include "Title:"
      expect(subject).to include "Address:"
      expect(subject).to include "Property Type:"
      expect(subject).to include "Nightly Rate in USD:"
      expect(subject).to include "Max Guests:"
      expect(subject).to include "Email:"
      expect(subject).to include "Phone Number:"
      expect(subject).to include "Great job! Listing"
    end
  end

  context "list (no records)" do
    let(:cli) { Holidays::Cli.new(["list"], StringIO.new, StringIO.new) }

    subject do
      cli.execute!
      cli.stdout.string
    end

    it do
      expect(subject).to include "No offers found."
    end
  end

  context "list" do
    before { create(:property) }

    let(:cli) { Holidays::Cli.new(["list"], StringIO.new, StringIO.new) }

    subject do
      cli.execute!
      cli.stdout.string
    end

    it do
      expect(subject).to include "Found 1 offer."
      expect(subject).to include "MYTESTID: My Test Title"
    end
  end

  context "continue" do
    before { create(:property_as_draft ) }
    let(:cli) { Holidays::Cli.new(["continue", "MYTESTID"], stdin2, StringIO.new) }

    subject do
      cli.execute!
      cli.stdout.string
    end

    it do
      expect(subject).to include "Continuing with MYTESTID"
      expect(subject).to include "Title: My Test Title"
      expect(subject).to include "Great job! Listing MYTESTID is complete!"
    end
  end

  context "view" do
    before { create(:property) }
    let(:cli) { Holidays::Cli.new(["view", "MYTESTID"], stdin1, StringIO.new) }

    subject do
      cli.execute!
      cli.stdout.string
    end

    it do
      expect(subject).to include "Listing MYTESTID Details:"
      expect(subject).to include "Title: My Test Title"
      expect(subject).to include "Address: My, Test, Address"
      expect(subject).to include "Property Type: Private Room"
      expect(subject).to include "Nightly Rate in USD: 36.59"
      expect(subject).to include "Max Guests: 3"
      expect(subject).to include "Email: email@email.com"
      expect(subject).to include "Phone Number: +5555555"
    end
  end
end
