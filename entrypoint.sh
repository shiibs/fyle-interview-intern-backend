#!/bin/bash
set -e

# Check the first argument for 'test' or 'start'
if [ "$1" = 'test' ]; then
  # Reset the database
  export FLASK_APP=core/server.py
  rm -f core/store.sqlite3
  flask db upgrade -d core/migrations/

  # Run tests with coverage
  pytest --cov=core --cov-report=html -vvv -s tests/

elif [ "$1" = 'start' ]; then
  # Start the server
  exec gunicorn -c gunicorn_config.py core.server:app
else
  echo "Invalid argument. Use 'test' to run tests or 'start' to run the server."
  exit 1
fi