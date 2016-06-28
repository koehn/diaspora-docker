#!/bin/bash --login

cd $HOME && \
  curl -L https://s.diaspora.software/1t | bash && \
  echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> $HOME/.bashrc && \
  source "/home/diaspora/.rvm/scripts/rvm" && \
  rvm autolibs read-fail && \
  rvm install 2.2
