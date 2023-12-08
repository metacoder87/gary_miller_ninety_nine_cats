#!/usr/bin/env bash
# exit on error
set -o errexit

bundle _2.2.34_ install
RAILS_ENV=production bundle exec rake assets:precompile
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake db:seed
bundle exec rake assets:clean