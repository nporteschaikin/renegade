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
set :rails_env, :production
set :unicorn_binary, "/usr/bin/unicorn"
set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

role :web, "205.186.136.165"
role :app, "205.186.136.165"

after "deploy:update_code", "restart_unicorn"

namespace :deploy do
	task :start, :roles => :app, :except => { :no_release => true } do 
		run "cd #{current_path} && #{try_sudo} #{unicorn_binary} -c #{unicorn_config} -E #{rails_env} -D"
	end
	task :stop, :roles => :app, :except => { :no_release => true } do 
		run "#{try_sudo} kill `cat #{unicorn_pid}`"
	end
	task :graceful_stop, :roles => :app, :except => { :no_release => true } do
		run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
	end
	task :reload, :roles => :app, :except => { :no_release => true } do
		run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
	end
	task :restart, :roles => :app, :except => { :no_release => true } do
		stop
		start
	end
end