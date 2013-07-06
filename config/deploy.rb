require "puma/capistrano"
require "bundler/capistrano"
require "rvm/capistrano"

default_run_options[:pty] = true

set :default_shell, "/bin/bash -l"
set :use_sudo, false
set :application, "renegade"
set :repository,  "git@github.com:nporteschaikin/renegade.git"
set :user, "deploy"
set :deploy_to, "/apps/renegade"
set :ssh_options, { :forward_agent => true }
set :puma_socket, "tcp://0.0.0.0:9292"

role :web, "205.186.136.165"
role :app, "205.186.136.165"
