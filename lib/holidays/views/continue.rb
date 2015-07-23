class Holidays::Views::Continue < Holidays::Views::Interactive

	def draw
		w ui('ui.continue.message-begin', id: data_record.id)

		fields.each_pair do |name, title|
			if data_record.send(name).nil?
				value = r(name, title)
				data_record.update_attributes name => value
			else
				field name, data_record.send(name)
			end
		end

		data_record.update_attributes(is_draft: false)
    	w ui('ui.continue.message-end', id: data_record.id)
	end
end
