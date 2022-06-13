#!/bin/bash

set -euo pipefail

./bin/rails db:migrate
rm -f tmp/pids/server.pid
exec ./bin/rails server --binding=0.0.0.0
