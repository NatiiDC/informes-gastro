# config valid only for current version of Capistrano
lock '3.11.0'

set :application, 'sistema-informes'
set :repo_url, 'git@github.com:NatiiDC/informes-gastro.git'
set :branch, 'mode-production'

# Rbenv options
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_map_bins, fetch(:rbenv_map_bins, []).push('foreman')

# Foreman options
set :foreman_export_path, '/etc/init'
set :foreman_options, -> {
  Hash[app: "#{fetch(:application)}/application",
       user: 'vagrant',
       env: current_path.join('.env')]
}

set :rails_env, 'production'

set :linked_files, fetch(:linked_files, []).push('config/database.yml', '.env')

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

after 'deploy:published', 'foreman:export'
after 'deploy:finished', 'service:restart'
