#!/bin/bash

if [ "$RAILS_ENV" = 'production' ]; then
  echo 'harukabe server release stage: production'
  bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 8000 -b '0.0.0.0'"
elif [ "$RAILS_ENV" = 'staging' ]; then
  echo 'harukabe server release stage: staging'
  bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 8000 -b '0.0.0.0'"
else
  echo 'harukabe server release stage: development'
  bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -p 8000 -b '0.0.0.0'"
fi