#!/bin/bash

function do_as_diaspora {
	su - diaspora -c "cd /home/diaspora/diaspora && RAILS_ENV=production DB=postgres $1"
}

function setup {
	su - diaspora -c "cd /home/diaspora && \
	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
	  curl -L dspr.tk/1t | bash && \
	  echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc && \
	  source "$HOME/.rvm/scripts/rvm" && \
	  rvm autolibs read-fail && \
	  rvm install 2.1 && \
	  cd ~ && \
	  git clone -b master git://github.com/diaspora/diaspora.git && \
	  cd diaspora && \
	  gem install bundler && \
	  RAILS_ENV=production DB=postgres  bin/bundle install --without test development "
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

echo "Starting docker-entrypoint with argument '$1'"

if [ "$1" = 'run' ]; then
	run
elif [ "$1" = 'setup' ]; then
	setup
elif [ "$1" = 'init-db' ]; then
	init_db
elif [ "$1" = 'upgrade' ]; then
	do_as_diaspora "rvm update"
	do_as_diaspora "git checkout Gemfile.lock db/schema.rb && git pull && cd .. && cd - && gem install bundler && bin/bundle && bin/rake db:migrate "
	precompile_assets
else
	echo "Not sure what to do; here have a shell"
	/bin/bash
fi
