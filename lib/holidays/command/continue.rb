class Holidays::Command::Continue < Holidays::Command::View

	def initialize(app)
		super(app)
		@view = Holidays::Views::Continue.new(app, self)
	end

end
