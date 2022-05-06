#!/bin/bash

set -euo pipefail

# workaround for docker-compose scheduler
wait-for-it --timeout=60 --strict mysql:3306

./bin/rails db:migrate
rm -f tmp/pids/server.pid
exec ./bin/rails server --binding=0.0.0.0
