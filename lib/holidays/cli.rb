module Holidays
	class Cli
		attr_reader :argv, :stdout, :stdin

		def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)
    		@argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
  		end

  		def execute!
    		begin
    			@app = App.new(self)
    		rescue Exception => e
    			@stdout.write(e.message)
    			exit(1)
    		end
		end
	end
end
