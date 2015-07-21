module Holidays
	module Command
		class Base
			attr_reader :view
			attr_reader :params

			def initialize(app)
				@app = app
			end

			def allow_params(params = [])
				@params = params
			end
		end
	end
end
