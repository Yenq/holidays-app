class Holidays::Views::List < Holidays::Views::Static
	def draw
		if data_collection.empty?
			w ui('ui.list.collection.message-empty')
		else
			w ui('ui.list.collection.message', number: data_collection.count, s: (data_collection.count > 1) ? 's' : '')
			
			data_collection.each do |record|
				w ui('ui.list.collection.item', record.attributes)
			end
		end
	end
end
