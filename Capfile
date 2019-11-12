# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"
require "capistrano/rails"
require "capistrano/passenger"
require "capistrano/rbenv"
require "capistrano/console"
require "capistrano/bundler"
require "capistrano/docker"
require 'capistrano/docker/assets'
require 'capistrano/docker/migration'

set :rbenv_type, :user
set :rbenv_ruby, '2.6.5'

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }