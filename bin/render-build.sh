#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rails db:drop db:create db:migrate
