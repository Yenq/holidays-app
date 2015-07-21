$LOAD_PATH << File.join(File.dirname(__FILE__), "holidays")

#system
require 'rubygems'
require 'bundler/setup'

require 'active_record'
require 'sqlite3'

require 'cli'
require 'app'

require 'config'

#commands
require 'command/base'
require 'command/new'
require 'command/list'
require 'command/continue'
require 'command/view'

#views
require 'views/base'
require 'views/static'
require 'views/interactive'
require 'views/list'
require 'views/show'
require 'views/new'
require 'views/continue'

require 'model/property'
require 'language'
