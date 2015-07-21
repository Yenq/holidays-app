class Holidays::Command::New < Holidays::Command::Base
	def initialize(app)
		super(app)
		@view = Holidays::Views::New.new(app, self)
	end

	def do(params = {})
		record = Holidays::Model::Property.create(id: Holidays::Model::Property.generate_id)
		view.assign(record: record)
		view.draw
	end
end
