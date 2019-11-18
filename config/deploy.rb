# config valid for current version and patch releases of Capistrano
lock '~> 3.11.2'

set :application, 'keto-backend'
set :pty, true
set :repo_url, 'git@github.com:michalwiacek/keto-backend.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/apps/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
set :linked_files, fetch(:linked_files, []).push('.env','config/database.yml', 'config/master.key')
set :keep_releases, 5
# set :current_dir, '/current'
# set :current_path, "/home/deploy/#{fetch :application}"
# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
# namespace :deploy do
#   desc "Initialize application"
#   task :initialize do
#     invoke 'env_file:copy'
#     invoke 'composing:build'
#     invoke 'composing:database:up'
#     invoke 'composing:database:create'
#     invoke 'composing:database:migrate'
#   end

#   after :published, :restart do
#     invoke 'composing:restart:web'
#     invoke 'composing:database:migrate'
#   end

#   before :finished, :clear_containers do
#     on roles(:app) do
#       execute "docker ps -a -q -f status=exited | xargs -r docker rm -v"
#       execute "docker images -f dangling=true -q | xargs -r docker rmi -f"
#     end
#   end
# end


namespace :rails do
  desc 'Open the rails console on primary app server'
  task :console do
    on roles(:app), primary: true do
      rails_env = fetch(:production)
      execute_interactively "#{bundle_cmd} #{current_path}/script/rails console #{rails_env}"
    end
  end

  desc 'Open the rails dbconsole on primary db server'
  task :dbconsole do
    on roles(:db), primary: true do
      rails_env = fetch(:production)
      execute_interactively "#{bundle_cmd} #{current_path}/script/rails dbconsole #{rails_env}"
    end
  end

  def execute_interactively(command)
    user = fetch(:user)
    port = fetch(:port) || 22
    cmd = "ssh -l #{user} #{host} -p #{port} -t 'cd #{deploy_to}/current && #{command}'"
    info "Connecting to #{host}"
    exec cmd
  end

  def bundle_cmd
    if fetch(:rbenv_ruby)
      # FIXME: Is there a better way to do this? How does "execute :bundle" work?
      "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{File.join(fetch(:rbenv_path), '/bin/rbenv')} exec bundle exec"
    else
      'ruby '
    end
  end
end
