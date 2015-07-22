require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rubygems'
require 'bundler/setup'

require 'active_record'
require 'sqlite3'
require 'factory_girl'

ENV['HOLIDAYS_ENV'] = "test"

require 'holidays'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    begin
      FactoryGirl.reload
    ensure
      #
    end
  end

  config.after(:each) do
  	Holidays::Model::Property.delete_all
  end
end
