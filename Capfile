# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"
# require "capistrano/rails"
require "capistrano/console"
# require 'capistrano/rbenv'
# require "capose"
# require "capistrano/bundler"

# set :rbenv_type, :user
# set :rbenv_ruby, '2.6.5'

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
