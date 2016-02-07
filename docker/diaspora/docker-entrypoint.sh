#!/bin/bash

function do_as_diaspora {
	su - diaspora -c "cd /home/diaspora/diaspora && RAILS_ENV=production DB=postgres $1"
}

function run {
	echo "Staring Diaspora"
	do_as_diaspora "./script/server"
	echo "Really wasn't expecting this"
}

function init_db {
	do_as_diaspora "bin/rake db:create db:schema:load"
	precompile_assets
	run
}

function precompile_assets {
	do_as_diaspora "bin/rake assets:precompile"
}

if [ "$1" = 'run' ]; then
	run
elif [ "$1" = 'init-db' ]; then
	init_db
elif [ "$1" = 'upgrade' ]; then
	do_as_diaspora "rvm update"
	do_as_diaspora "git checkout Gemfile.lock db/schema.rb && git pull && cd .. && cd - && gem install bundler && bin/bundle && bin/rake db:migrate "
	precompile_assets
fi
