require "bundler/capistrano"
require "rvm/capistrano"

default_run_options[:pty] = true

set :default_shell, "/bin/bash -l"
set :use_sudo, false
set :application, "renegade"
set :repository,  "git@github.com:nporteschaikin/renegade.git"
set :user, "deploy"
set :deploy_to, "/apps/renegade"
set :ssh_options, { forward_agent: true }
set :normalize_asset_timestamps, false
set :keep_releases, 1

role :web, "162.216.18.112"
role :app, "162.216.18.112"

namespace :deploy do
	task :restart, except: { no_release: true } do
		run "kill -s USR2 `cat #{shared_path}/pids/unicorn.pid`"
	end
	task :start, except: { no_release: true } do
		run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D -E production"
	end
	task :stop, except: { no_release: true } do
		run "kill -s QUIT `cat #{shared_path}/pids/unicorn.pid`"
	end
end
