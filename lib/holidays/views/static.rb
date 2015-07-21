class Holidays::Views::Static < Holidays::Views::Base
	protected
	#write
	def w(line = '', values = {})
		values.each_pair { |k, v| line.gsub!(":#{k.to_s}", v.to_s) }
		@app.write_line(line)
	end

	def ui(str)
		Holidays::Language::UI[str]
	end

	def error(type)
		Holidays::Language::ERRORS[type]
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
