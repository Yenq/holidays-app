class Holidays::Command::List < Holidays::Command::Base
	def initialize(app)
		super(app)
		@view = Holidays::Views::List.new(app, self)
	end

	def do(params = {})
		@app.reload
		view.assign(collection: @app.objects)
		view.draw
	end
end
