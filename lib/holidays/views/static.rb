class Holidays::Views::Static < Holidays::Views::Base
	protected
	#write
	def w(line = '')
		@app.write_line(line)
	end

	def ui(str, values = {})
		result = Holidays::Language::UI[str]
		values.each_pair { |k, v| result = result.gsub(":#{k.to_s}", v.to_s) }
		result
	end

	def ui_error(type)
		ui 'ui.error.basic', message: (Holidays::Language::ERRORS[type] || Holidays::Language::ERRORS[:default])
	end

	def field(name, value)
		_value = value
		values = Holidays::Language::ADDITIONAL_VALUES[name]

		if values.is_a? Array
			_value = values[value]
		end

		w "#{Holidays::Language::FIELDS[name]}: #{_value}"
	end

	def fields
		Holidays::Language::FIELDS
	end
end
