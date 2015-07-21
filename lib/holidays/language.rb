module Holidays
	module Language
		FIELDS = {
					title:   		'Title',
					address: 		'Address',
					property_type:  'Property Type',
					rate: 			'Nightly Rate in USD',
					guests: 		'Max Guests',
					email: 			'Email',
					phone:    		'Phone Number'
				}

		MASKS = { property_type: /^[0-2]{1}$/, rate: /^(\d+?)(\.\d{1,2})?$/, guests: /^\d+$/ }

		ERRORS = { property_type: 'Error: must be a number 0, 1 or 2', guests: 'Error: must be a number', default: 'Error: please input correct value'}

		ADDITIONAL_VALUES = { property_type: ["Holiday Home", "Apartment", "Private Room"] }

		UI = {
			'ui.list.collection.message-empty' => 'No offers found.',
			'ui.list.collection.message'       => 'Found :number offer:s.',
			'ui.list.collection.item'					 => ':id: :title',
			'ui.new.message-begin'						 => 'Starting with new property :id.',
			'ui.new.message-end' 							 => 'Great job! Listing :id is complete!',
			'ui.continue.message-begin' 			 => 'Continuing with :id',
			'ui.continue.message-end' 				 => 'Great job! Listing :id is complete!',
			'ui.show.message-begin' 					 => 'Listing :id Details:'
		}
	end
end
