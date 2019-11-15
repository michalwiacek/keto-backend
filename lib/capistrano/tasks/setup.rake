namespace :setup do
  desc "Upload .env file to shared folder"
  task :env do
    on roles(:app) do
      upload! fetch(:env_file_path), ["..", shared_path, fetch(:env_file_path)].join('/')
    end
  end

  namespace :check do
    desc "Task description"
    task :linked_files => fetch(:env_file_path)
  end
end

namespace :env_file do
  desc "Copy shared .env file"
  task :copy do
    on roles(:app) do
      within current_path do
        execute "cp ../#{shared_path}/.env #{current_path}/.env"
      end
    end
  end
end
