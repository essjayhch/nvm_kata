#!/bin/bash
gem install bundler && \
bundle install && \
bundle exec rake rubocop && \
bundle exec rake test && \
tar czf ../nvm_kata.tar.gz --exclude='tmp/*' --exclude='log/*' .
docker build -t essjayhch/nvm_kata .
