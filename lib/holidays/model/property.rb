require 'active_record'
require 'securerandom'

module Holidays
	module Model
		class Property < ActiveRecord::Base
			self.primary_key = :id

			def self.generate_id
				SecureRandom.hex.upcase.slice(0,8)
			end
		end
	end
end
