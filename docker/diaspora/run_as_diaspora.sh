#!/bin/bash --login

export HOME=/home/diaspora

cd $HOME && \
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
  curl -L dspr.tk/1t | bash && \
  echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> $HOME/.bashrc && \
  source "/home/diaspora/.rvm/scripts/rvm" && \
  rvm autolibs read-fail && \
  rvm install 2.1 && \
  cd $HOME/diaspora && \
  git init && \
  git remote add origin git://github.com/diaspora/diaspora.git && \
  git fetch && \
  git checkout -t origin/master && \
  gem install bundler && \
  RAILS_ENV=production DB=postgres  bin/bundle install --without test development

