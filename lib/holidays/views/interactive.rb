class Holidays::Views::Interactive < Holidays::Views::Static

	protected
	#iteractive reading
	def r(field, title)
		reg_exp = Holidays::Language::MASKS[field]
		values  = Holidays::Language::ADDITIONAL_VALUES[field]
		result = nil
		interactive = true
    while interactive
			w "#{title}:"
			values.each_with_index {|v, i| w("  [#{i}] - #{v}") } if values.is_a? Array

	        result = @app.read_line

	        if reg_exp.nil? || result =~ reg_exp
	        	interactive = false
	       	else
	       		w error(field) || error(:default)
	       		w
	       	end
    end
    result
	end
end
