module Holidays
	module Views
		class Base
			attr_accessor :objects

			def initialize(app, cmd)
				@app, @cmd = app, cmd
				@objects = {}
			end

			def assign(objects)
				@objects.merge!(objects)
				objects.keys.each do |method|
					self.class.send(:define_method, "data_#{method}".to_sym, Proc.new { @objects[method]})
				end
			end

			def draw
				#put base code here
			end
		end
	end
end
