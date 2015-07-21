class Holidays::Command::Continue < Holidays::Command::Base
	def initialize(app)
		super(app)
		@view = Holidays::Views::Continue.new(app, self)
	end

	def do(params = {})
		id = params.first
		record = Holidays::Model::Property.find(id)
		view.assign(record: record)
		view.draw
	end
end
