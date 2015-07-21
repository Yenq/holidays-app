module Holidays
	class App
		attr_accessor :commands
		attr_accessor :objects

		def initialize(cli)
			@cli = cli
			@commands = {}
			@objects = []

			[:new, :list, :continue, :view].each do |cmd|
				register(cmd)
			end

			unless params[0].nil?
				cmd = params[0].to_sym
				run(cmd, params.slice(1, params.size))
			end
		end

		def read_line
			@cli.stdin.gets.chomp
		end

		def write_line(line)
			@cli.stdout.puts(line)
		end

		def params
			@cli.argv
		end

		def stdout
			@cli.stdout
		end

		def stdin
			@cli.stdin
		end

		def run(cmd, params = [])
			raise Exception, "Command <#{cmd}> not found" unless @commands.keys.include?(cmd)
			@commands[cmd].do(params)
		end

		def reload
			@objects = Holidays::Model::Property.where(is_draft: false)
		end

		private

		def register(cmd)
			@commands[cmd] = eval("Holidays::Command::#{cmd.to_s.capitalize}.new(self)")
		end
	end
end
