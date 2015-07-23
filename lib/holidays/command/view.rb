class Holidays::Command::View < Holidays::Command::Base
	def initialize(app)
		super(app)
		@view = Holidays::Views::Show.new(app, self)
	end

	def do(params = {})
		id = params.first
		record = Holidays::Model::Property.find(id)
		view.assign(record: record)
		view.draw
	end
end
