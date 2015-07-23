class Holidays::Views::Show < Holidays::Views::Static
	def draw
		w ui('ui.show.message-begin', id: data_record.id)

		fields.each_pair do |name, title|
			field(name, data_record.send(name))
		end
	end
end
