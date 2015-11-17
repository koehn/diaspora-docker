#!/bin/bash

if [ "$1" = 'run' ]; then
	su - diaspora -c "cd /home/diaspora/diaspora && DB=production RAILS_ENV=production ./script/server"
elif [ "$1" = 'init-db' ]; then
	su - diaspora -c "cd /home/diaspora/diaspora && RAILS_ENV=production DB=postgres  bin/rake db:create db:schema:load"
elif [ "$1" = 'precompile-assets' ]; then
	su - diaspora -c "cd /home/diaspora/diaspora && RAILS_ENV=production DB=postgres bin/rake assets:precompile"
fi
