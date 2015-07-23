class Holidays::Views::New < Holidays::Views::Interactive

	def draw
		w ui('ui.new.message-begin', id: data_record.id)

    	fields.each_pair do |key, value|
    		v = r(key, value)
      		data_record.update_attributes key => v
    	end

    	data_record.update_attributes(is_draft: false)
    	w ui('ui.new.message-end', id: data_record.id)
	end
end
