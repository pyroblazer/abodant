#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# DISABLE_DATABASE_ENVIRONMENT_CHECK=1 
rails db:create 
rails db:migrate 
rails db:seed