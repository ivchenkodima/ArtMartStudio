lock '3.4.0'

set :main, 'artmartstudio'

set :repo_url, "git@bitbucket.org:artmartstudio/#{fetch(:main)}.git"

set :deploy_to, "/home/#{fetch(:main)}/application"

set :linked_files, %w[config/application.yml]

set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle]

set :rbenv_type, :system

set :rbenv_ruby, File.read('.ruby-version').strip

after 'deploy:published', 'passenger:restart'

after 'deploy:finished', 'deploy:cleanup'
